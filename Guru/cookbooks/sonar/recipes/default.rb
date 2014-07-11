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



%w{node["sonarqube"]["dir"]["logs"] node["sonarqube"]["dir"]["conf"]}.each do | path |
	directory path do
		owner "root"
		group "root"
		mode "0755"
		action :create
		recursive true
	end if File.directory?(path)
end


remote_file "#{node["sonarqube"]["dir"]["tmp"]}/#{node['sonarqube']['downloads']['filename']}" do
  action :create_if_missing
  owner "root"
  group "root"
  mode "0644"
  source node['sonarqube']['downloads']['package']
end

execute "unzip-sonar" do
	command "unzip #{node["sonarqube"]["dir"]["tmp"]}/#{node['sonarqube']['downloads']['filename']} -d /usr/local/ && mv -f /usr/local/sonarqube-#{node['sonarqube']['downloads']['version']} #{node["sonarqube"]["dir"]["home"]}"
	action :run
end unless File.directory?(node["sonarqube"]["dir"]["home"])

file "#{node["sonarqube"]["dir"]["tmp"]}/#{node['sonarqube']['downloads']['filename']}" do
	action :delete
	owner "root"
	group "root"
	mode "0644"
end

link "#{node["sonarqube"]["dir"]["binary"]}/sonarqube" do
	to "#{node["sonarqube"]["dir"]["home"]}/bin/linux-x86-64/sonar.sh"
	action :create
end

link "/etc/init.d/sonarqube" do
	to "#{node["sonarqube"]["dir"]["home"]}/bin/linux-x86-64/sonar.sh"
	action :create
end

link "#{node["sonarqube"]["dir"]["conf"]}" do
	to "#{node["sonarqube"]["dir"]["home"]}/conf"
	action :create
end

link "#{node["sonarqube"]["dir"]["logs"]}"  do
	to "#{node["sonarqube"]["dir"]["home"]}/logs"
	action :create
end

template "#{node["sonarqube"]["dir"]["home"]}/conf/sonar.properties" do
	source "sonar.properties.erb"
	owner "root"
	group "root"
	mode "0644"
end

mysql_user "sonar" do
	password node['sonarqube']["database"]['password']
	action :create
end


mysql_database "sonar" do
	action :create
end

mysql_privilege "sonar_privilege" do
	privileges 	"ALL PRIVILEGES"
	user 		node['sonarqube']["database"]['user']
	password 	node['sonarqube']["database"]['password']
	action 		:grant
	grant_option true
end


service "sonarqube" do
 	supports :status => true, :restart => true, :reload => true
 	action [ :enable, :start ]
end




