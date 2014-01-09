require 'sinatra'
require 'haml'
require 'rest-client'
get '/' do
  RestClient.proxy = ENV['http_proxy']
  response = RestClient::Resource.new(
      'http://google.com',
      #:ssl_client_cert  =>  OpenSSL::X509::Certificate.new(File.read("")),
      #:ssl_client_key   =>  OpenSSL::PKey::RSA.new(File.read("key.pem"), "passphrase, if any"),
      :ssl_ca_file      =>  "../ca.pem",
      :verify_ssl       =>  OpenSSL::SSL::VERIFY_PEER
  ).get

  #haml :index
  response.body
end