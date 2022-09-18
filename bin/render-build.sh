set -o errexit

bundle install && yarn install && bundle exec rake assets:precompile && bundle exec rake assets:clean && bundle exec rails webpacker:compile && bundle exec rake db:migratebundle exec rake assets:precompile && bundle lock --add-platform x86_64-linux
bundle exec rake assets:clean
bundle exec rake db:migrate