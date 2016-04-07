#
# Cookbook Name:: RestfulSrvr-api-server
# Attribute:: default
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

default[:RestfulSrvr_api][:repo]           = "restful-srvr/RestfulSrvr-api"
default[:RestfulSrvr_api][:token]          = nil
default[:RestfulSrvr_api][:release]        = "v#{RestfulSrvr::API::Chef.cookbook_version(run_context)}"
default[:RestfulSrvr_api][:owner]          = "RestfulSrvr"
default[:RestfulSrvr_api][:group]          = "RestfulSrvr"
default[:RestfulSrvr_api][:home]           = "/etc/restful-srvr/api-server"
default[:RestfulSrvr_api][:deploy_path]    = "/opt/RestfulSrvr-api/#{node[:RestfulSrvr_api][:release]}"
default[:RestfulSrvr_api][:port]           = 26200
default[:RestfulSrvr_api][:proxy_port]     = 80
default[:RestfulSrvr_api][:host]           = node[:fqdn]
default[:RestfulSrvr_api][:config_path]    = "#{node[:RestfulSrvr_api][:home]}/config.json"
default[:RestfulSrvr_api][:config]         = {
  home_path: node[:RestfulSrvr_api][:home]
}
