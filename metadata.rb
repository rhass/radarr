name              'radarr'
maintainer        'Ryan Hass'
maintainer_email  'ryan@invalidchecksum.net'
license           'MIT'
description       'Installs Sonarr.'
version           '1.0.1'
issues_url        'https://github.com/rhass/radarr/issues'
source_url        'https://github.com/rhass/radarr'

supports          %w(ubuntu debian)
chef_version      '>= 13.0'

depends 'poise-archive'
