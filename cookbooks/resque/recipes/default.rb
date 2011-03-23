#
# Cookbook Name:: resque
# Recipe:: default
#
if ['solo', 'util'].include?(node[:instance_role])
  execute "install resque gem" do
    command "gem install resque redis redis-namespace yajl-ruby -r"
    not_if { "gem list | grep resque" }
  end

  node[:applications].each do |app, data|
    # workers
    populate_workers = 6
    
    # monit
    template "/etc/monit.d/resque_#{app}.monitrc" do 
      owner 'root' 
      group 'root' 
      mode 0644 
      source "monitrc.conf.erb" 
      variables({ 
        :app_name => app, 
        :rails_env => node[:environment][:framework_env],
        :populate_workers => populate_workers
      }) 
    end

    # playlist worker
    template "/data/#{app}/shared/config/resque_playlist.conf" do
      owner node[:owner_npae]
      group node[:owner_name]
      mode 0644
      source "resque_playlist.conf.erb"
    end
    
    # facebook worker
    template "/data/#{app}/shared/config/resque_facebook.conf" do
      owner node[:owner_npae]
      group node[:owner_name]
      mode 0644
      source "resque_facebook.conf.erb"
    end
    
    # populate workers
    populate_workers.times do |n|
      template "/data/#{app}/shared/config/resque_populate_#{n + 1}.conf" do
        owner node[:owner_npae]
        group node[:owner_name]
        mode 0644
        source "resque_populate.conf.erb"
      end
    end

    execute "ensure-resque-is-setup-with-monit" do 
      command "monit reload" 
    end

    execute "restart-resque" do 
      command %Q{ 
        echo "sleep 20 && monit -g #{app}_resque restart all" | at now 
      }
    end
  end 
end
