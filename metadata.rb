name              'radarr'
maintainer        'Ryan Hass'
maintainer_email  'ryan@invalidchecksum.net'
license           'MIT'
description       'Installs Radarr.'
version           '1.0.2'
issues_url        'https://github.com/rhass/radarr/issues'
source_url        'https://github.com/rhass/radarr'

supports          %w(ubuntu debian)
chef_version      '>= 13.0'

depends 'poise-archive'
