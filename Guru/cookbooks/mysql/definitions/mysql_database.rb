define :mysql_database, :action => :create do
	if params[:db_name] != nil
		encoding = params[:encoding] ||= node['mysql']['data']['encoding']

		if params[:action] == :create

			mysql_command "create_database" do
				sql "CREATE SCHEMA IF NOT EXISTS #{params[:db_name]} CHARACTER SET ='#{encoding}' COLLATE #{node['mysql']['data']['collate']}"
				action :execute
			end
		end	
	else
		Chef::Application.fatal! "You must define a database name."
	end
end