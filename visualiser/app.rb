require 'sinatra'
require "sinatra/reloader" if development?
require 'helpers/rdf_repository'

$LOAD_PATH.unshift '.'
set :environment, :development

get '/' do
  erb :index
end

before "/education/*" do
  content_type 'application/json'
end

get '/education/levels/:id' do |id|
  halt 404
end

get '/education/phases/pack' do
  rdf_repository = RDFRepository.new

  rdf_repository.phases
end
