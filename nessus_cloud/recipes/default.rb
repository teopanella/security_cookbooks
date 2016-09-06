case node[:platform]
when 'redhat', 'centos', 'amazon'
	template '/tmp/nessus.sh' do
	  source 'nessus_amazon_linux.sh'
	  owner 'root'
	  group 'root'
	  mode '0755'
	end
when 'ubuntu'
	template '/tmp/nessus.sh' do
	  source 'nessus_ubuntu_linux.sh'
	  owner 'root'
	  group 'root'
	  mode '0755'
	end
end

execute 'execute_script' do
  Chef::Log.info("execute script Nessus Agent Install")
  user 'root'
  command 'bash /tmp/nessus.sh'
  action :run
end
