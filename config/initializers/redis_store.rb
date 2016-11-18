redis_config = Rails.application.config_for(:redis)

# $redis = Redis.new(host: redis_config['host'], port: redis_config['port'])
# $redis.select(0)
# Redis::Objects.redis = $redis
#
# sidekiq_url = "redis://#{redis_config['host']}:#{redis_config['port']}/0"
# Sidekiq.configure_server do |config|
#   config.redis = { namespace: 'sidekiq', url: sidekiq_url }
# end
# Sidekiq.configure_client do |config|
#   config.redis = { namespace: 'sidekiq', url: sidekiq_url }
# end
#
# redis_url = ENV["REDISCLOUD_URL"] || "redis://127.0.0.1:6379/0/myapp"
# MyApp::Application.config.cache_store = :redis_store, redis_url
Rails.application.config.cache_store = :redis_store, { :host => "#{redis_config['host']}",
                                       :port => "#{redis_config['port']}",
                                       :namespace => "cache",
                                       :expires_in => 90.minutes }
# MyApp::Application.config.session_store :redis_store, redis_server: redis_url
# YourApp::Application.config.session_store :redis_store, servers: { namespace: 'sessions' }
Rails.application.config.session_store :redis_store, :servers => { :host => "#{redis_config['host']}",
                                       :port => "#{redis_config['port']}",
                                       :namespace => "sessions" }
