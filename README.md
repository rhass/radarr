Radarr Cookbook
===============
Installs [Radarr](https://radarr.video) and its required dependencies.

Attributes
----------
#### radarr::default
- `['radarr']['user']` (`String`) - user which radarr will be ran as
- `['radarr']['group']` (`String`) - group which owns the radarr installation
- `['radarr']['home']` (`String`) - directory where radarr will place its `.config` directory
- `['radarr']['createuser']` (`Boolean`) - option to not create user (the above options must be filled in however)
- `['radarr']['settings']['AnalyticsEnabled']` (`String`) - `'True'`
- `['radarr']['settings']['ApiKey']` (`String`) - `'changeme'`
- `['radarr']['settings']['AuthenticationMethod']` (`String`) - `'None'`
- `['radarr']['settings']['BindAddress']` (`String`) - `'*'`
- `['radarr']['settings']['Branch']` (`String`) - `'master'`
- `['radarr']['settings']['EnableSsl']` (`String`) - `'False'`
- `['radarr']['settings']['LogLevel']` (`String`) - `'Info'`
- `['radarr']['settings']['Port']` (`Integer`) - `8989`
- `['radarr']['settings']['SslCertHash']` (`String`) - `nil`
- `['radarr']['settings']['SslPort']` (`Integer`) - `9898`
- `['radarr']['settings']['UpdateMechanism']` (`String`) - `'BuiltIn'`
- `['radarr']['settings']['UrlBase']` (`String`) - `nil`

##### Empty settings should be defined as `nil`.

Usage
-----
#### radarr::default

It installs the mono Radarr from the GitHub releases. Defaults to the latest available version.

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Special Thanks
--------------
This cookbook was originally forked from the Sonarr cookbook.
Jeroen Jacobs (jeroenj) did most of the work on Sonarr cookbook and deserves your
thanks if you get any use out of it or this cookbook.

LICENSE AND AUTHORS
===================

* Author:: Ryan Hass <ryan@invalidchecksum.net>
* Author:: Jeroen Jacobs <git@jeroenj.be>

* Copyright (c) 2018, Ryan Hass
* Copyright (c) 2015-2016, Jeroen Jacobs

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
