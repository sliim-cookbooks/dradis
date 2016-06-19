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

describe file '/opt/dradis-ce/Gemfile.plugins' do
  it { should be_file }
  it { should be_mode 644 }
  its(:content) { should match(/^gem 'dradis-nmap'/) }
  its(:content) { should match(/^gem 'dradis-metasploit'/) }
end

describe file '/opt/dradis-ce/config/database.yml' do
  it { should be_file }
  it { should be_mode 600 }
  its(:content) { should match(/^development:$/) }
  its(:content) { should match(/^test:$/) }
  its(:content) { should match(/^production:$/) }
  its(:content) { should match(/adapter: sqlite3$/) }
  its(:content) { should match(/pool: 5$/) }
  its(:content) { should match(/timeout: 5000$/) }
  its(:content) { should match(%r{database: db/development.sqlite3$}) }
  its(:content) { should match(%r{database: db/test.sqlite3$}) }
  its(:content) { should match(%r{database: db/production.sqlite3$}) }
end

describe file '/opt/dradis-ce/config/secrets.yml' do
  it { should be_file }
  it { should be_mode 600 }
  its(:content) { should match(/^development:$/) }
  its(:content) { should match(/^test:$/) }
  its(:content) { should match(/^production:$/) }
  its(:content) { should match(/secret_key_base: my-dev-secret-key$/) }
  its(:content) { should match(/secret_key_base: my-test-secret-key$/) }
  its(:content) { should match(/secret_key_base: my-prod-secret-key$/) }
end
