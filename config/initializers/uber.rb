UBER_CLIENT = Uber::Client.new({
  server_token: ENV["UBER_CLIENT_ID"],
  client_id: ENV["UBER_CLIENT_TOKEN"],
  client_secret: ENV["UBER_CLIENT_SECRET"]
  })


