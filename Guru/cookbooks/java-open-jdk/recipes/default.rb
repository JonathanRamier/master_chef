#
# Cookbook Name:: java-open-jdk
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "add-repository" do
	command "sudo add-apt-repository ppa:webupd8team/java"
	user "vagrant"
	action :run
	notifies :run, "execute[apt-get-update]", :immediately
end

execute "apt-get-update" do
	command "sudo apt-get update"
	user "vagrant"
	action :nothing
end

execute "install-oracle-java" do
	command "sudo apt-get install oracle-java8-installer"
	user "vagrant"
	action :run
end