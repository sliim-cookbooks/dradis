# -*- coding: utf-8 -*-
#
# Cookbook Name:: dradis
# Recipe:: default
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

git node['dradis']['install_path'] do
  repository node['dradis']['git_repository']
  reference node['dradis']['git_reference']
end

directory "#{node['dradis']['install_path']}/plugins"
node['dradis']['addons'].each do |addon, url|
  git "#{node['dradis']['install_path']}/plugins/#{addon}" do
    repository url
    reference 'master'
  end
end

template "#{node['dradis']['install_path']}/Gemfile.plugins" do
  mode '0644'
  source 'Gemfile.plugins.erb'
  variables plugins: node['dradis']['plugins']
end

db_name = node['dradis']['databag']['name']
db_item = node['dradis']['databag']['database_item']
s_item = node['dradis']['databag']['secrets_item']

# rubocop:disable Style/MultilineTernaryOperator
database = node['dradis']['database']['use_db'] ?
             data_bag_item(db_name, db_item) :
             node['dradis']['database']
secrets = node['dradis']['secrets']['use_db'] ?
            data_bag_item(db_name, s_item) :
            node['dradis']['secrets']

template "#{node['dradis']['install_path']}/config/database.yml" do
  mode '0600'
  source 'database.yml.erb'
  variables config: database['config']
end

template "#{node['dradis']['install_path']}/config/secrets.yml" do
  mode '0600'
  source 'secrets.yml.erb'
  variables config: secrets['config']
end
