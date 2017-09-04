#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# install package httpd

package "httpd" do
	action :install
end

service "httpd" do
	action [:start,:enable]
end

directory "/home/chefuser" do
	action :create
end

user "chefuser" do
	comment "user for chef"
	home "/home/chefuser"
	action :create
end

group "chefgroup" do
	members "chefuser"
	action :create	
end

remote_file "/opt/chef-12.21.1-1.el7.x86_64.rpm" do
#	source "https://packages.chef.io/files/stable/chef/12.21.1/el/7/chef-12.21.1-1.el7.x86_64.rpm" 
	source "file:///home/chefuser/chef-12.21.1-1.el7.x86_64.rpm"	
	action :create
end

template "/etc/hosts" do
	source "myhosts.erb"
	action :create
end

execute "comment for execute" do
	cwd "/home"
	command "chown -R chefuser:chefgroup chefuser"
	user "root"
end

