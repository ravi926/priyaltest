#
# Cookbook Name:: script_execution
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


powershell_script 'Install IIS' do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature Web-Server
  EOH
end

