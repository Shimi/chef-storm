default['storm']['base_url'] = "https://dl.dropbox.com/u/133901206"
default['storm']['version'] = "0.8.2"

default['storm']['user'] = "storm"
default['storm']['symlink'] = "/usr/local/storm"
default['storm']['install_dir'] = "/usr/local"
default['storm']['conf_dir'] = "/usr/local/storm/conf"
default['storm']['data_dir'] = "/var/lib/storm"
default['storm']['logs_dir'] = "/var/log/storm"
default["storm"]["jmx_address"] = ""
default["storm"]["zookeeper_servers"] = []

default['storm']['nimbus_host'] = "localhost"

default["storm"]["ui_port"] = "8080"

default["storm"]["topology_message_timeout_secs"] = "30"

default["storm"]["worker_childopts"] = "-Xms1G -Xmx1G -Djmxremote.port=1%ID% -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=#{node['storm']['jmx_address']} -XX:+HeapDumpOnOutOfMemoryError "

