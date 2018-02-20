package %w(dirmngr apt-transport-https)

user node['radarr']['user'] do
  system true
  manage_home true
  home node['radarr']['home']
  shell '/usr/sbin/nologin'
end

apt_repository 'mono' do
  uri "#{node['mono']['apt']['uri']}/#{node['platform']}"
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key '3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF'
end

package %w(mono-devel mediainfo sqlite3 libmono-cil-dev)

app = radarr node['radarr']['version'] do
  notifies :restart, 'service[radarr]'
end

systemd_unit 'radarr.service' do
  content(Unit: {
            Description: 'Radarr Daemon',
            After: 'syslog.target network.target',
          },
          Service: {
            User: node['radarr']['user'],
            Group: node['radarr']['user'],
            Type: 'simple',
            ExecStart: "/usr/bin/mono #{app.install_path}/Radarr.exe -nobrowser",
            TimeoutStopSec: '20',
            KillMode: 'process',
            Restart: 'on-failure',
          },
          Install: {
            WantedBy: 'multi-user.target',
          })

  only_if 'which systemctl'
  action :create
end

template '/etc/init/radarr.conf' do
  source 'init.conf.erb'
  variables user: node['radarr']['user']
  not_if 'which systemctl'
end

directory ::File.join(node['radarr']['home'], '.config/Radarr') do
  user node['radarr']['user']
  group node['radarr']['user']
  recursive true
end

file ::File.join(node['radarr']['home'], '.config/Radarr/config.xml') do
  user node['radarr']['user']
  group node['radarr']['user']
  mode 0600
  content(lazy do
    require 'nokogiri'
    Nokogiri::XML::Builder.new { |xml| xml.Config { node[:radarr][:settings].each { |k, v| xml.send(k, v) } } }.doc.root.to_xml(
      save_with: Nokogiri::XML::Node::SaveOptions::NO_EMPTY_TAGS | Nokogiri::XML::Node::SaveOptions::FORMAT
    )
  end)
  notifies :restart, 'service[radarr]'
end

service 'radarr' do
  action [:enable, :start]
end
