# config valid only for current version of Capistrano
lock '3.8.1'

set :repo_url, 'git@github.com:maxime-menant/webapp_es_test.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :ssh_options, { :forward_agent => true }

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, -> { File.join('', 'home', fetch(:user), fetch(:application)) }

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Configuring capistrano log output
set :format ,   :pretty
set :log_level, :debug # :debug :error :info

# Default value for :pty is false
set :pty,  false

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push(
  'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets',
  'public/system'
)


set :keep_releases, 5
set :keep_assets,   5

# # Sidekiq
# set :sidekiq_options,       '-q default -q mailers'

# Puma
set :puma_user,       -> { fetch(:user) }
set :puma_rackup,     -> { File.join(current_path, 'config.ru') }
set :puma_conf,       -> { "#{shared_path}/puma.rb" }

set :puma_bind,       -> { "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock" }
set :puma_state,      -> { "#{shared_path}/tmp/pids/puma.state" }
set :puma_pid,        -> { "#{shared_path}/tmp/pids/puma.pid" }
set :puma_access_log, -> { "#{shared_path}/log/puma.error.log" }
set :puma_error_log,  -> { "#{shared_path}/log/puma.access.log" }

set :puma_preload_app,        true
set :puma_init_active_record, true  # Change to true if using ActiveRecord








