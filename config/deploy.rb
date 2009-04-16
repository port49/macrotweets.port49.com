default_run_options[:pty] = true
set :application, "macrotweets.port49.com"
set :repository,  "git@github.com:port49/macrotweets.port49.com.git"
set :scm, :git
set :ssh_options, { :forward_agent => true }

set :runner, 'macrotweets'
set :branch, 'macrotweets'
set :deploy_via, :remote_cache

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/macrotweets/public_html"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "macrotweets.port49.com"
role :web, "macrotweets.port49.com"
role :db,  "macrotweets.port49.com", :primary => true

namespace :passenger do

  desc 'Restart Application'
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

end

namespace :deploy do
  
  desc "Link in the production database.yml" 
  task :after_update_code do
    run "ln -nfs #{deploy_to}/#{shared_dir}/system/database.yml #{release_path}/config/database.yml"
  end
end

after :deploy, 'passenger:restart'
after :deploy, 'deploy:cleanup'

