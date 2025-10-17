function printavo-dev
nvm use 18; mprocs "bundle exec rails s -u webrick" "bundle exec rails c" "bundle exec sidekiq" "bin/vite dev"
end
