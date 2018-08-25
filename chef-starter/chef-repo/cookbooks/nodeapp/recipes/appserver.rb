#
# Cookbook:: .
# Recipe:: appserver
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Installing GIT
package ['appserver']['git'] do
  action :install
end

#Create directory for temporary nodejs downloaded tar file

directory node['appserver']['nodejs_temp_path'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

#download tar file from the location "https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.xz"

remote_file 'node['appserver']['nodejs_temp_path']/node-v8.11.4-linux-x64.tar.xz' do
  source 'https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.xz'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory node['appserver']['node_executables'] do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

execute 'apache_configtest' do
    command 'tar xvf node-v*.tar.?z --strip-components=1 -C node['appserver']['node_executables']'
end


