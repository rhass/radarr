default['radarr']['version'] = 'latest'
default['radarr']['user'] = 'radarr'
default['radarr']['group'] = 'radarr'
default['radarr']['home'] = '/home/radarr'
default['radarr']['createuser'] = true


default['mono']['apt']['uri'] = 'https://download.mono-project.com/repo'

default['radarr']['settings'].tap do |radarr|
  radarr['AnalyticsEnabled']      = 'True'
  radarr['ApiKey']                = 'changeme'
  radarr['AuthenticationMethod']  = 'None'
  radarr['BindAddress']           = '*'
  radarr['Branch']                = 'develop'
  radarr['EnableSsl']             = 'False'
  radarr['LogLevel']              = 'Info'
  radarr['Port']                  = 7878
  radarr['SslCertHash']           = nil
  radarr['SslPort']               = 9898
  radarr['UpdateMechanism']       = 'BuiltIn'
  radarr['UrlBase']               = nil
end
