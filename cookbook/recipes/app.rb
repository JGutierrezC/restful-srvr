#
# Cookbook Name:: RestfulSrvr-api-server
# Recipe:: app
#
# Copyright (C) 2013-2014 Jamie Winsor
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "libarchive::default"
include_recipe "runit"

chef_gem "bundler"

group node[:RestfulSrvr_api][:group]

user node[:RestfulSrvr_api][:owner] do
  gid node[:RestfulSrvr_api][:group]
  home node[:RestfulSrvr_api][:home]
  system true
end

directory node[:RestfulSrvr_api][:home] do
  owner node[:RestfulSrvr_api][:owner]
  group node[:RestfulSrvr_api][:group]
  recursive true
end

file node[:RestfulSrvr_api][:config_path] do
  content JSON.generate(node[:RestfulSrvr_api][:config].to_hash)
end

asset = github_asset "RestfulSrvr-api.tar.gz" do
  repo node[:RestfulSrvr_api][:repo]
  release node[:RestfulSrvr_api][:release]
  github_token node[:RestfulSrvr_api][:token] unless node[:RestfulSrvr_api][:token].nil?
end

libarchive_file "RestfulSrvr-api.tar.gz" do
  path asset.asset_path
  extract_to node[:RestfulSrvr_api][:deploy_path]
  extract_options :no_overwrite
  owner node[:RestfulSrvr_api][:owner]
  group node[:RestfulSrvr_api][:group]

  action :extract
  notifies :restart, "runit_service[berks-api]"
  only_if { ::File.exist?(asset.asset_path) }
end

execute "RestfulSrvr-api-bundle-install" do
  user node[:RestfulSrvr_api][:owner]
  group node[:RestfulSrvr_api][:group]
  cwd node[:RestfulSrvr_api][:deploy_path]
  command "/opt/chef/embedded/bin/bundle install --deployment --without development test"
  not_if "cd #{node[:RestfulSrvr_api][:deploy_path]} && /opt/chef/embedded/bin/bundle check"
end

runit_service "berks-api" do
  sv_timeout 30
  action :enable
end
