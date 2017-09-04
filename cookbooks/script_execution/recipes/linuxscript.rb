#
# Cookbook Name:: script_execution
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

root_line = 'add the line below'
new_line = "# adding nagios user for sudoers\nnagios  ALL=(root)  NOPASSWD: /usr/share/nsclient/scripts/, /usr/share/nsclient/scripts/perfdata/bin/, /usr/share/nsclient/scripts/perfdata/var/, /usr/share/nsclient/scripts/perfdata/libexec/, /usr/share/nsclient/scripts/perfdata/libexec/perf/\nDefaults:nagios !requiretty"

ruby_block "write to file" do
   block do
	file = Chef::Util::FileEdit.new('/opt/sudoersfile')
	file.insert_line_if_no_match(/#{root_line}/, new_line)
	file.write_file
   end
end

cookbook_file "/opt/InstallationManager.tgz" do
	source "InstallationManager.tgz"
end

bash 'extract tar file' do
  cwd '/opt'
  code <<-EOH
    mkdir -p mylocalcookbook
    tar zxvf InstallationManager.tgz -C /opt/mylocalcookbook
    EOH
end


























