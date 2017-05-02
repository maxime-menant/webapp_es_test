# ############# #
#   Production  #
# ############# #

  require 'net/ssh/proxy/command'

  # Use a default host for the bastion, but allow it to be overridden
  bastion_host = '52.232.127.76'

  # Use the local username by default
  bastion_user = 'hbstaging'

  # Configure Capistrano to use the bastion host as a proxy
  ssh_command = "ssh #{bastion_user}@#{bastion_host} -W %h:%p"
  set :ssh_options, proxy: Net::SSH::Proxy::Command.new(ssh_command)



set :user, 'deploy'
set :use_sudo, false

server "deploy@10.0.1.4", roles: [:web, :app, :db], primary: true
server "deploy@10.0.1.7", roles: [:web, :app]
server "deploy@10.0.1.8", roles: [:web, :app]

set :application, "webapp"
set :rails_env, :production

set :branch, :master

set :rvm_ruby_string, 'ruby-2.3.1'
set :rvm_type, :user

# Puma
set :puma_init_active_record, true
set :puma_bind, "unix://#{shared_path}/tmp/sockets/web-app_puma.sock"
set :puma_threads,        [16, 16]
set :puma_workers,        4
set :puma_worker_timeout, 60

set :puma_enable_puma_worker_killer,  true
set :puma_server_available_ram,       16000  #Mb
set :puma_server_killer_frequency,    60    #secondes
set :puma_server_killer_threshold,    0.80

