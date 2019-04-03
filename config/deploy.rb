lock '3.11.0'

set :application, 'snb_portal'
set :repo_url, "ssh://feedr40@bitbucket.org/feedr40/#{fetch(:application)}"
set :user, 'feedr40'
set :deploy_to, "/home/ninequeens/#{fetch(:application)}"

# Don't change these unless you know what you're doing
set :pty,             false
set :use_sudo,        false
set :deploy_via,      :remote_cache
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', 'config/key')
set :linked_files, fetch(:linked_files, []).push('.env')
set :keep_releases, 5
set :debug, true
set :sidekiq_pid, File.join(shared_path, 'tmp', 'pids', 'sidekiq.pid')
set :sidekiq_cmd, "#{fetch(:bundle_cmd, "bundle")} exec sidekiq"
set :sidekiqctl_cmd, "#{fetch(:bundle_cmd, "bundle")} exec sidekiqctl"