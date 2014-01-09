require 'sinatra'
require 'haml'
require 'helpers/rdf_repository'
require 'helpers/level_builder'

before do
  @rdf_repository = RDFRepository.new
  @level_builder = LevelBuilder.new @rdf_repository
end

get '/' do
  haml :index
end

before "/education/*" do
  content_type 'application/json'
end

get '/education/levels' do
  @level_builder.buildLevels.to_json
end
