#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node["runner"]["dir"]["home"]}" do
  action :create_if_missing
  owner "root"
  group "root"
  mode "0644"
  source node['runner']['downloads']['package']
end
