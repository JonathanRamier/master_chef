current_directory = File.expand_path(File.dirname(__FILE__))
Chef::Config.ssl_verify_mode = :verify_peer
file_cache_path "#{current_directory}"
cookbook_path "#{current_directory}/cookbooks"
role_path "#{current_directory}/roles"
data_bag_path "#{current_directory}/data_bags" 