web: rvmsudo bundle exec thin -a 127.0.0.1 -R config.ru start -p 80
worker: redis-server
worker: bundle exec sidekiq -e development