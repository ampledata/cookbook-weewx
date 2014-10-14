chef_gem 'inifile'

require 'inifile'


WEEWX_CONF_FILE = '/etc/weewx/weewx.conf'

template '/etc/weewx/weewx.conf' do
  notifies :restart, 'service[weewx]'
end
