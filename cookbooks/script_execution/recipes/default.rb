#
# Cookbook Name:: script_execution
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


case node['platform']

when 'redhat','amazon'
  include_recipe "#{cookbook_name}::linuxscript"
when 'windows'
  include_recipe "#{cookbook_name}::windows_script"
else
  Chef::Log.info "#{cookbook_name} cookbook doesn't support for this platform"
end
