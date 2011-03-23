if ['app_master', 'app'].include?(node[:instance_role])
  template "/data/nginx/servers/idlefm.conf" do
    owner 'deploy'
    group 'deploy'
    mode 0644
    source "idlefm.conf.erb"
    variables({})
  end
  
  execute "/etc/init.d/nginx reload" do
    action :run
  end
end