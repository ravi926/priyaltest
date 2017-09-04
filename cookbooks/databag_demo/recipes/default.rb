#
# Cookbook Name:: databag_demo
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


login = data_bag('admins')

login.each do |val|
	data_value = data_bag_item('admins',val)
	if (val == "myattributes") then
		puts "groupname: #{data_value['groupname']}"
		puts "user : #{data_value['user']}"
		puts "password: #{data_value['password']}"
	
	user "#{data_value['user']}" do
		home "/home/#{data_value['user']}"
		password "#{data_value['password']}"
	end

	elsif (val == "webserver" ) then
        	puts "application1_ipadress: #{data_value['application1_ipadress']}"
	        puts "application1_ipadress: #{data_value['application2_ipadress']}"
	        puts "db_1_ipaddress: #{data_value['db_1_ipaddress']}"
	end
end
