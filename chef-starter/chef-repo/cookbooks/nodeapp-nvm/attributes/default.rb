default['appserver']['git'] = 'git'

default['appserver']['node']['version'] = '7'

default['appserver']['ip'] = node['ipaddress']

default['appserver']['username'] = 'vagrant'

default['appserver']['home'] = "/home/#{node['appserver']['username']}"

default['appserver']['nvm']['home'] = "#{node['appserver']['home']}/.nvm/"

default['appserver']['code_location'] = "#{node['appserver']['username']}/hello.js"