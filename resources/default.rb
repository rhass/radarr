require 'json'
require 'uri'

GITHUB_API_URI = 'https://api.github.com'

property :version, [String, Symbol], name_property: true
property :repo, String, default: 'Radarr/Radarr'
property :install_path, String, default: '/opt/radarr'
property :user, String, default: lazy { node['radarr']['user'] }
property :group, String, default: lazy { node['radarr']['user'] }

default_action :install

action :install do
  # TODO: Move default recipe bits into resource.
  directory install_path do
    user new_resource.user
    group new_resource.group
    recursive true
  end

  poise_archive url_for_version(version.to_s) do
    destination new_resource.install_path
    user new_resource.user
    group new_resource.group
  end
end

action_class do
  def releases_path
    @releases_path ||= "/repos/#{repo}/releases"
  end

  # Retrieves all available GitHub releases for a given repo and returns a hash.
  def releases
    @releases ||= JSON.parse(Chef::HTTP.new(GITHUB_API_URI).get(releases_path))
  end

  # Retrieves the latest release for a given repo and returns a hash.
  # Note, Draft releases and prereleases are not returned by this endpoint.
  # At the time of writing this, all Radarr releases have been marked as "prerelease" and
  # this method will return an empty set.
  # https://developer.github.com/v3/repos/releases/#get-the-latest-release
  def latest_stable
    @latest ||= JSON.parse(Chef::HTTP.new(GITHUB_API_URI).get("#{releases_path}/latest"))
  end

  # Retrieves the lastes release for a given repo including pre-releases and draft releases
  # and returns a hash.
  def latest
    @latest ||= releases.first
  end

  def named_version(version)
    @release = releases.map do |r|
      r['assets'].select {|asset| asset['name'] =~ /#{Regexp.escape(version)}/}.reject {|i| i.empty?}.first
    end
  end
  #['assets'].select {|asset| asset['name'] =~ /linux/}.first['browser_download_url']

  def version_info(version)
    case version
    when 'stable', 'latest_stable'
      latest_stable
    when 'latest'
      latest
    when /^(\d+)\.(\d+)\.(\d+)(\.\d+)?/
      named_version(version)
    else
      raise "Unsupported version: #{version}."
    end
  end

  def url_for_version(version)
    version_info(version)['assets'].select {|asset| asset['name'] =~ /#{node['os']}/}.first['browser_download_url']
  end
end
