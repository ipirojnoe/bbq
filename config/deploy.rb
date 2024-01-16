lock "~> 3.16.0"

set :application, "bbq"
set :repo_url, "git@github.com:ipirojnoe/bbq.git"

set :deploy_to, "/home/client/bbq"

append :linked_files, 'config/database.yml', '.env'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'

set :branch, ENV['BRANCH'] if ENV['BRANCH']
