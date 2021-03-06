# Binary path configuration
default['mysql']['path']['data']		= "/var/lib/mysql"
default['mysql']['path']['bin']			= "/usr/bin/mysql"
default['mysql']['path']['cnf']			= "/etc/mysql"
default['mysql']['path']['log']			= "/var/log/mysql"
default['mysql']['path']['tmp']			= "/tmp"


# Network configuration
default['mysql']['network']['address']	= "127.0.0.1"
default['mysql']['network']['hostname']	= "localhost"
default['mysql']['network']['port']		= 3306


# User Root configuration
default['mysql']['user']['name']		= "root"
default['mysql']['user']['pass']		= "123456789"


# Encoding configuration
default['mysql']['data']['encoding']	= "utf8"
default['mysql']['data']['collate']		= "utf8_general_ci"
