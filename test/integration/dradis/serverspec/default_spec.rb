# -*- coding: utf-8 -*-
require_relative 'spec_helper'

describe file '/opt/dradis-ce' do
  it { should be_directory }
  it { should be_mode 755 }
end

['dradis-calculator_cvss',
 'dradis-calculator_dread',
 'dradis-csv',
 'dradis-html_export',
 'dradis-mediawiki',
 'dradis-vulndb',
 'dradis-acunetix',
 'dradis-brakeman',
 'dradis-burp',
 'dradis-metasploit',
 'dradis-nessus',
 'dradis-nexpose',
 'dradis-nikto',
 'dradis-nmap',
 'dradis-ntospider',
 'dradis-openvas',
 'dradis-qualys',
 'dradis-plugins',
 'dradis-projects'].each do |p|
  describe file "/opt/dradis-ce/plugins/#{p}" do
    it { should be_directory }
    it { should be_mode 755 }
  end
end
