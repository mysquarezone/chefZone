#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'updatepackage' do
  action :update
  only_if node['platform'] == "ubuntu"
end
