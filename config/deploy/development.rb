server '68.183.82.78', user: 'ninequeens'

set :stage, :development
set :rails_env, :development
set :branch, 'rishabh'
#set :puma_bind, 'tcp://0.0.0.0:3001'

# ['104.211.26.74', '40.121.34.13'].each do |port|
#   server port,
#          user: 'ubuntu',
#          roles: %w{web app db},
#          port: port
# end
namespace :deploy do
  desc 'Restart application'
  task :restart do
    #invoke 'unicorn:restart'
    invoke 'puma:restart'
  end

  desc 'Start application'
  task :start do
   # on roles(:worker), in: :sequence, wait: 5 do
     # invoke 'sidekiq:start'
   # end
   # on roles(:web), in: :sequence, wait: 5 do
      #run "passenger start #{current_path} -a 127.0.0.1 -p 3001 -e development -d"
      invoke 'puma:start'
   # end
  end

  desc 'Stop application'
  task :stop do
   # on roles(:worker), in: :sequence, wait: 5 do
    #  invoke 'sidekiq:stop'
    #end
   # on roles(:web), in: :sequence, wait: 5 do
      #run "passenger stop #{current_path} -p 3001"
   # end
   invoke 'puma:stop'
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
  after :publishing, 'deploy:restart'
end

