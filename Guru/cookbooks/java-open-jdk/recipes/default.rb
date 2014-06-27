#
# Cookbook Name:: java-open-jdk
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{software-properties-common python-software-properties}.each do |pkg|
	apt_package "#{pkg}" do
		action :install
	end
end

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

execute "auto-accept-license" do
	command "echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections"
	action :run
end


apt_package "oracle-java8-installer" do
	action :install
end