#
# Cookbook:: helloworld
# Recipe:: default
#

# Copyright:: 2018, The Authors, All Rights Reserved.

# write a resource for installing git

package 'nginx' do
  action :install
end

service 'nginx' do
  action :start
end