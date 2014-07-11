define :mysql_database, :action => :create do
	encoding = params[:encoding] ||= node['mysql']['data']['encoding']
	db_name  = params[:db_name]  ||= params[:name]


	if params[:action] == :create

		mysql_command "create_database" do
			sql "CREATE SCHEMA IF NOT EXISTS #{db_name} CHARACTER SET ='#{encoding}' COLLATE #{node['mysql']['data']['collate']}"
			action :execute
		end

	elsif params[:action] == :delete
		
		mysql_command "delete database" do
			sql "DROP SCHEMA #{db_name};"
			action :execute
		end
	end	
end