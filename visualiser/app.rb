require 'sinatra'
require 'haml'
require 'hamlbars'
$LOAD_PATH.unshift '.'
require 'helpers/phases_builder'
require 'helpers/level_builder'

before do
  @rdf_repository = RDFRepository.new
  @level_builder = LevelBuilder.new @rdf_repository
  @phases_builder = PhasesBuilder.new @rdf_repository
end

get '/' do
  haml :index
end

before "/education/*" do
  content_type 'application/json'
end

get '/education/levels/:id' do |id|
  if id != 'zgckjxs'
    halt 404
  end
  @level_builder.buildLevels.to_json
end

get '/education/phases' do
  @phases_builder.buildPhases.to_json
end
