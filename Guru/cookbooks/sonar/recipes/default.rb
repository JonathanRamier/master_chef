#
# Cookbook Name:: sonar
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "/usr/local/sonarqube.zip" do
  action :create_if_missing
  owner "root"
  group "root"
  mode "0644"
  source "http://dist.sonar.codehaus.org/sonarqube-4.3.zip"
end

execute "tar /usr/local/sonarqube.zip" do
	command "tar -xvf /usr/local/sonarqube.zip -C /usr/local/sonar"
	action :run
end



