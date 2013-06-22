define :storm_service do

	service_name = "#{params[:name]}"
	user = "#{node['storm']['user']}"

	template "#{node['storm']['conf_dir']}/storm.yaml" do
	  source "storm.yaml.erb"
	  owner "#{user}"
	  group "#{user}"
	  mode "0644"
	  notifies :restart, "service[#{service_name}]"
	end

	service service_name do
	  provider Chef::Provider::Service::Upstart
	  supports :restart => true
	  action :nothing
	end

	template "/etc/init/#{service_name}.conf" do
	  source "#{service_name}.conf.erb"
	  owner "root"
	  group "root"
	  mode "0644"
	  notifies :enable, "service[#{service_name}]"
	  notifies :restart, "service[#{service_name}]"
	end

end
