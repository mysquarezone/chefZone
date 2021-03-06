#
# Cookbook:: .
# Recipe:: appserver
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# installing git

package node['appserver']['git'] do
  action :install
end

# Installing nodejs using nvm ref:https://nodesource.com/blog/installing-node-js-tutorial-using-nvm-on-mac-os-x-and-ubuntu/

# 1. Execute raw linux statements

# note: idempotence is not gaurenteed
execute 'nvm install' do
  command 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash'
  action :run
end

current_userName = node['appserver']['username']

directory node['appserver']['nvm']['home'] do
  owner current_userName
  group current_userName
  mode '0755'
  action :create
end

version = node['appserver']['node']['version']

# execute 'nvminstall' do
#   command 'nvm install 8'
#   user current_userName
#   action :run
# end


template node['appserver']['code_location'] do
  source 'hello.js.erb'
  owner current_userName
  group current_userName
  mode '0755'
  action :create_if_missing
end


# 2. Use chef suber market cookbook. Ref: https://supermarket.chef.io/cookbooks?utf8=%E2%9C%93&q=nvm&platforms%5B%5D=

# include_recipe 'nvm'

# version = 'v0.10.5'
# node.set['nvm']['nvm_install_test']['version'] = version

# nvm_install version  do
# 	from_source false
# 	alias_as_default true
# 	action :create
# end