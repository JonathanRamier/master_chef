define :mysql_user, :action => :create do

	host = params[:host] ||= node["mysql"]["network"]["hostname"]
	user = params[:user] ||= params[:name]
	pass = params[:password] ||= ''
	

	# Create a MySQL user
	if params[:action] == :create

		mysql_command "create_user" do
			sql "CREATE USER \'#{user}\'@\'#{host}\' IDENTIFIED BY \'#{pass}\';" 
			action :execute
		end
		

	elsif params[:action] == :delete
		mysql_command "delete_user" do
			# TOD0: Faire la requete de suppression d'utilisateur
		end
	elsif params[:action] == :update_password
		mysql_command "set_new_passwd" do
			sql "SET PASSWORD FOR '#{params[:user]}'@'#{host}' = PASSWORD('#{params[:password]}');" 
			action :execute
		end
	end
end