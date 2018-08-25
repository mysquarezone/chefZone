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

execute 'untarnodeexecutables' do
    command 'tar xvf node-v*.tar.?z --strip-components=1 -C node['appserver']['node_executables']'
end

directory node['appserver']['node_executables']/etc do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
end

execute 'echo command execute' do
    command 'echo 'prefix=/usr/local' > node/etc/npmrc'
end

remote_directory '/opt/' do
  source 'node['appserver']['node_executables']'
  owner 'root'
  group 'root'
  mode '0755'
  action :create_if_missing
end

execute 'echo command execute' do
    command 'chown -R root: /opt/node'
end

link '/usr/local/bin/node' do
    to '/opt/node/bin/node'
    mode '0755'
    link_type :symbolic
end

link '/usr/local/bin/npm' do
    to '/opt/node/bin/npm'
    mode '0755'
    link_type :symbolic
end

file 'node['appserver']['node_executables']/hello.js' do
    content 'var http = require('http');
    http.createServer(function (req, res) {
      res.writeHead(200, {'Content-Type': 'text/plain'});
      res.end('Hello World\n');
    }).listen(8080, '172.31.4.196');
    console.log('Server running at http://172.31.4.196:8080/');'
    mode '0755'
end

apt_update 'updatepackages' do
    action :update
end

execute 'Install npm' do
    command 'npm install pm2 -g'
end

execute 'start hello.js' do
    command 'pm2 start node['appserver']['node_executables']/hello.js'
end