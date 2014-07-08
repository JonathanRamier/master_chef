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

template "#{node['mysql']['path']['cnf']}/my.cnf" do
	source "my.cnf.erb"
	owner "root"
	group "root"
	mode "0644"
	backup false
end


service "mysql" do
	supports :status => true, :restart => true, :reload => true, :stop => true
	action [ :restart ]
end

