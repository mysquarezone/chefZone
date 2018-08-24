#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_update 'updatepackage' do
  action :update
  only_if node['platform'] == "ubuntu"
end

#defining variable(in ruby), Below is example for array
packages = ["tree","git","apache2"]