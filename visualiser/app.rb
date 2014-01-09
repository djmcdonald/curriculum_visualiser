require 'sinatra'
require 'haml'
require 'helpers/rdf_repository'

before do
  @rdf_repository = RDFRepository.new
end

get '/' do
  haml :index
end

before "/education/*" do
  content_type 'application/xml'
end

get '/education/levels' do
  @rdf_repository.levels
end
