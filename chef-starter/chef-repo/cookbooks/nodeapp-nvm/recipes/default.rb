#
# Cookbook:: nodeapp-nvm
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

if node['platform'] != "ubuntu"
  raise 'this cookbook is deveoped for only ubuntu'
end

apt_update 'updatepackages' do
  action :update
end

include_recipe 'nodeapp-nvm::appserver'