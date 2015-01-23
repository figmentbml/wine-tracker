require 'yelp'
Yelp.client.configure do |config|
  if Rails.env.test?
  else
    config.consumer_key = ENV['YELP_CONSUMER_KEY']
    config.consumer_secret = ENV['YELP_CONSUMER_SECRET']
    config.token = ENV['YELP_TOKEN']
    config.token_secret = ENV['YELP_TOKEN_SECRET']
  end
end
