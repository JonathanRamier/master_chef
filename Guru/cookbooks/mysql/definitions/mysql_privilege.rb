definition :mysql_privilege, :action => :grant, :privileges => "usage" do
	
	mysql_privileges = ["ALL PRIVILEGES", "ALTER", "CREATE", "CREATE TEMPORARY TABLES", "DELETE", "DROP", "EXECUTE", "FILE", "INDEX", "INSERT", "LOCK TABLES", "PROCESS", "REFERENCES", "RELOAD", "REPLICATION CLIENT", "REPLICATION SLAVE", "SELECT", "SHOW DATABASES", "SHUTDOWN", "SUPER", "UPDATE", "USAGE"]
	privileges 		 = params[:privileges]
	db_name    		 = params[:db_name]  	||= '*.*'
	grant_option 	 = params[:grant_options] == true  ? "GRANT OPTION" : ""
	host 			 = params[:host] 		||= node["mysql"]["network"]["hostname"]
	user 			 = params[:user] 		||= params[:name]
	pass 			 = params[:password] 	||= ''

	#Todo faire une validation des privilèges mysql avec ceux entrés
	# Supprimer les autres privileges quand All privileges est mis

	#if mysql_privilege.include? privilege
	#end
	if params[:action] == :grant
		mysql_command "grant_user" do
			sql "GRANT #{privileges} ON #{db_name} TO '#{user}'@'#{host}'; FLUSH PRIVILEGES;"
			action :execute
		end
		
	elsif params[:action] == :revoke

		mysql_command "revoke_user" do
			sql "REVOKE #{privileges} ON #{db_name} TO '#{user}'@'#{host}'; FLUSH PRIVILEGES;"
			action :execute
		end

	end
end