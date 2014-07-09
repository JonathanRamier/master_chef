#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java-open-jdk::default"
include_recipe "mysql::default"


%w{node["sonarqube"]["dir"]["logs"] node["sonarqube"]["dir"]["home"] node["sonarqube"]["dir"]["conf"]}.each do | path |
	directory "#{path}" do
		owner "root"
		group "root"
		mode "0755"
		action :create
		recursive true
	end unless File.directory?(path)
end


remote_file "#{node["sonarqube"]["dir"]["tmp"]}/#{node['sonarqube']['downloads']['filename']}" do
  action :create_if_missing
  owner "root"
  group "root"
  mode "0644"
  source node['sonarqube']['downloads']['package']
end

execute "unzip-sonar" do
	command "unzip #{node["sonarqube"]["dir"]["tmp"]}/#{node['sonarqube']['downloads']['filename']}"
	creates "#{node["sonarqube"]["dir"]["home"]}"
	action :run
end


file "#{node["sonarqube"]["dir"]["tmp"]}" do
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

template "#{node["sonarqube"]["dir"]["home"]}/conf/sonar.properties" do
	source "sonar.properties.erb"
	owner "root"
	group "root"
	mode "0644"
end

mysql_user "create_user" do
	user node['sonarqube']["database"]['user']
	password node['sonarqube']["database"]['password']
	action :create
end

execute "sonar start" do
	command "sonar.sh start"
	action :run
end



