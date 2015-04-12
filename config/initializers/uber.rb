UBER_CLIENT = Uber::Client.new do |config|
  config.server_token  = ENV["UBER_ID"]
  config.client_id     = ENV["UBER_TOKEN "]
  config.client_secret = ENV["UBER_SECRET"]
end
