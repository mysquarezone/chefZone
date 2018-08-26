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

