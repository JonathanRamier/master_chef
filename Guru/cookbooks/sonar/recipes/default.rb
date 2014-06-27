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

link "#{node["sonarqube"]["dir"]["logs"]}" do
	to "#{node["sonarqube"]["dir"]["home"]}/logs"
end

link "#{node["sonarqube"]["dir"]["bin"]}" do
	to "#{node["sonarqube"]["dir"]["home"]}/bin/linux-x86-64/sonar.sh"
end

link "#{node["sonarqube"]["dir"]["conf"]}" do
	to "#{node["sonarqube"]["dir"]["home"]}/conf"
end


execute "sonar start" do
	command "sonar.sh start"
	action :run
end



