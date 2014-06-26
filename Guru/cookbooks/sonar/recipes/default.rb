#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node["sonarqube"]["dir"]["temp"]}" do
  action :create_if_missing
  owner "root"
  group "root"
  mode "0644"
  source node['sonarqube']['downloads']['package']
end

execute "unzip-sonar" do
	command "unzip #{node["sonarqube"]["dir"]["temp"]}"
	creates "#{node["sonarqube"]["dir"]["home"]}"
	action :run
end


file "#{node["sonarqube"]["dir"]["temp"]}" do
	action :delete
	owner "root"
	group "root"
	mode "0644"
end



