#
# Cookbook:: nodeapp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'updatepackages' do
  action :update
end