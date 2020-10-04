name              'radarr'
maintainer        'Ryan Hass'
maintainer_email  'ryan@invalidchecksum.net'
license           'MIT'
description       'Installs Radarr.'
version           '1.0.5'
issues_url        'https://github.com/rhass/radarr/issues'
source_url        'https://github.com/rhass/radarr'

%w(ubuntu debian).each { |p| supports p }
chef_version      '>= 13.0'

gem 'nokogiri'
depends 'poise-archive'
