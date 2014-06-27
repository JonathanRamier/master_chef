#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


execute "define-password" do
	command "echo mysql-server mysql-server/root_password password #{node['mysql']['user']['pass']} | sudo /usr/bin/debconf-set-selections"
	action :run
end 


execute "confirm-password" do
	command "mysql-server mysql-server/root_password_again password #{node['mysql']['user']['pass']} | sudo /usr/bin/debconf-set-selections"
	action :run
end 


package "mysql-server" do
	action :install
end

template "my.cnf.erb" do
	source "#{node['mysql']['path']['cnf']}"
	owner "root"
	group "root"
	mode "0644"
end


service "mysql" do
	supports :status => true, :restart => true, :reload => true :stop => true
	action [ :enable, :restart ]
end

