# -*- coding: utf-8 -*-
#
# Cookbook Name:: dradis
# Attributes:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['dradis']['git_repository'] = 'https://github.com/dradis/dradis-ce.git'
default['dradis']['git_reference'] = 'master'
default['dradis']['install_path'] = '/opt/dradis-ce'
default['dradis']['addons'] = {
  'dradis-calculator_cvss' => 'https://github.com/dradis/dradis-calculator_cvss',
  'dradis-calculator_dread' => 'https://github.com/dradis/dradis-calculator_dread',
  'dradis-csv' => 'https://github.com/dradis/dradis-csv',
  'dradis-html_export' => 'https://github.com/dradis/dradis-html_export',
  'dradis-mediawiki' => 'https://github.com/dradis/dradis-mediawiki',
  'dradis-vulndb' => 'https://github.com/dradis/dradis-vulndb',
  'dradis-acunetix' => 'https://github.com/dradis/dradis-acunetix',
  'dradis-brakeman' => 'https://github.com/dradis/dradis-brakeman',
  'dradis-burp' => 'https://github.com/dradis/dradis-burp',
  'dradis-metasploit' => 'https://github.com/dradis/dradis-metasploit',
  'dradis-nessus' => 'https://github.com/dradis/dradis-nessus',
  'dradis-nexpose' => 'https://github.com/dradis/dradis-nexpose',
  'dradis-nikto' => 'https://github.com/dradis/dradis-nikto',
  'dradis-nmap' => 'https://github.com/dradis/dradis-nmap',
  'dradis-ntospider' => 'https://github.com/dradis/dradis-ntospider',
  'dradis-openvas' => 'https://github.com/dradis/dradis-openvas',
  'dradis-qualys' => 'https://github.com/dradis/dradis-qualys',
  'dradis-plugins' => 'https://github.com/dradis/dradis-plugins',
  'dradis-projects' => 'https://github.com/dradis/dradis-projects'
}

default['dradis']['plugins'] = []

default['dradis']['database']['use_db'] = false
default['dradis']['database']['config'] = {}
default['dradis']['secrets']['use_db'] = false
default['dradis']['secrets']['config'] = {}

default['dradis']['databag']['name'] = 'dradis'
default['dradis']['databag']['database_item'] = 'database'
default['dradis']['databag']['secrets_item'] = 'secrets'
