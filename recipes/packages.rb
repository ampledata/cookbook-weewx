#
# Cookbook Name:: weewx
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

pkg_name = 'weewx_2.7.0-1_all.deb'
pkg_url = "http://downloads.sourceforge.net/project/weewx/#{pkg_name}"
pkg_path = "/usr/src/#{pkg_name}"


remote_file pkg_path do
  source pkg_url
  action :nothing
end


http_request "HEAD #{pkg_url}" do
  message ''
  url pkg_url
  action :head
  if File.exists?(pkg_path)
    headers 'If-Modified-Since' => File.mtime(pkg_path).httpdate
  end
  notifies :create, "remote_file[#{pkg_path}]", :immediately
end


package 'python-serial'
package 'python-usb'
package 'python-imaging'
package 'python-dev'
package 'python-pip'
package 'python-configobj'
package 'python-cheetah'

dpkg_package pkg_path
