#
# Cookbook:: .
# Recipe:: appserver
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#Installing GIT
package node['appserver']['git'] do
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

remote_file '/home/ubuntu/nodetemp/node-v8.11.4-linux-x64.tar.xz' do
    source 'https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.xz'
    mode '0755'
    action :create
end

directory node['appserver']['node_executables'] do
    mode '0755'
    action :create
end

execute 'untarnodeexecutables' do
    command "tar xvf /home/ubuntu/nodetemp/node-v* --strip-components=1 -C /home/ubuntu/node"
end

directory "/home/ubuntu/node/etc" do
    mode '0755'
    action :create
end

execute 'echo command execute' do
    command "echo 'prefix=/usr/local' > /home/ubuntu/node/etc/npmrc"
end

execute 'Move folder' do
    command "sudo mv -n /home/ubuntu/node /opt/"
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



file "/opt/node/hello.js" do
    content "var http = require('http'); http.createServer(function (req, res) { res.writeHead(200, {'Content-Type': 'text/plain'}); res.end('Hello World\n'); }).listen(8080, '172.31.9.54'); console.log('Server running at http://172.31.9.54:8080/');"
    mode '0755'
    action :create
end

apt_update 'updatepackages' do
    action :update
end

execute 'Install npm' do
    command 'npm install pm2 -g'
end

execute 'start hello.js' do
    command "pm2 start /opt/node/hello.js"
end

apt_update 'updatepackages' do
    action :update
end