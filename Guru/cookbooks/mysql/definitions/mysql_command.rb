define :mysql_command, :action => :execute do

	if params[:sql] != nil
		
		sql = params[:sql]

		if params[:action] == :execute
			inline_cmd 	= "#{node['mysql']['path']['bin']} -u root -e \"#{sql}\""
			execute "excute-cmd-sql" do
				command "#{inline_cmd}"
				action :run
				ignore_failure true
			end

		elsif params[:action] == :import
			if params[:file_path] != nil
				execute "excute-script-file" do
					command "#{node['mysql']['path']['bin']} < #{params[:file_path]}"
					action :run
					ignore_failure true
				end
			end
		end
	end
end