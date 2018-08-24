#default['package_name'] = "apache2"

# if node['platform'] == "ubuntu"
#    default['package_name'] = "apache2"
# else
#    default['package_name'] = "httpd"
# end

if node['platform'] == "ubuntu"
    default['package_name'] = "tomcat8"
else
    default['package_name'] = "tomcat"
end
