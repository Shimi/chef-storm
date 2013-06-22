  include_recipe "chef-zookeeper"
  include_recipe "jzmq"

  user = "#{node['storm']['user']}"
  version = "#{node['storm']['version']}"
  install_dir = "#{node['storm']['install_dir']}"
  storm_home = "#{install_dir}/storm-#{version}"
  logs_dir = "#{node['storm']['logs_dir']}"
  data_dir = "#{node['storm']['data_dir']}"

  package "python" do
    action [:install]
  end

  user "storm" do
    action [:create, :modify]
    system true
  end

  src_filepath  = "/tmp/storm-#{version}.zip"

  remote_file src_filepath do 
    source "#{node['storm']['base_url']}/storm-#{version}.zip"
    action :create_if_missing
    not_if {File.exists?(storm_home)}
  end

  bash "extract storm" do
    code %(unzip #{src_filepath} -d #{install_dir} && chown -R #{user}:#{user} #{storm_home} && rmdir #{storm_home}/logs)
    not_if {File.exists?(storm_home)}
  end

  link "#{node['storm']['symlink']}" do
    to storm_home
  end

  directory "#{data_dir}" do
    owner "#{user}"
    group "#{user}"
    action :create
    not_if {File.exists?(data_dir)}
  end

  directory "#{logs_dir}" do
    owner "#{user}"
    group "#{user}"
    action :create
    not_if {File.exists?(logs_dir)}
  end

  link "#{storm_home}/logs" do
    owner "#{user}"
    group "#{user}"
    to logs_dir
  end