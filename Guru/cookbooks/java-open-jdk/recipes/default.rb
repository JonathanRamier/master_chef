#
# Cookbook Name:: java-open-jdk
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "add-repository" do
	command "add-apt-repository ppa:webupd8team/java"
	action :run
end

execute "apt-get-update" do
	command "apt-get update"
	action :run
end

execute "install-oracle-java" do
	command "apt-get install oracle-java8-installer"
	action :run
end