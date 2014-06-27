define :mysql_user :action => :create do
	if params[:user] != nil && params[:password] != nil

		host = params[:host] ||= node["mysql"]["network"]["hostname"]

		# Create a MySQL user
		if params[:action] == :create 
			template "create_user.sql.erb" do
				source "#{node["mysql"]["path"]["tmp"]}"
				owner "root"
				group "root"
				mode "0644"
				variables( :username => params[:user], :host => host, :password => params[:password] )
			end
			

		elsif params[:action] == :delete
			template "delete_user.sql.erb" do
				source "#{node["mysql"]["path"]["tmp"]}"
				owner "root"
				group "root"
				mode "0644"
				variables( :username => params[:user])
			end
		elsif params[:action] == :update_password
			template "update_user_password.sql.erb" do
				source "#{node["mysql"]["path"]["tmp"]}"
				owner "root"
				group "root"
				mode "0644"
				variables( :username => params[:user], :host => host, :password => params[:password] )
			end
		end
	else
		Chef::Application.fatal! "You must define a user name and a user password"		
	end
end