#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node["sonarqube"]["dir"]["home"]}" do
  action :create_if_missing
  owner "root"
  group "root"
  mode "0644"
  source node['sonarqube']['downloads']['package']
end
