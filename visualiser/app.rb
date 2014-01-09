require 'sinatra'
require 'haml'
require 'rest-client'
get '/' do
  RestClient.proxy = ENV['http_proxy']
  response = RestClient.get "http://www.google.co.uk"

  haml :index
end