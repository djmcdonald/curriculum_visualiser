require 'sinatra'
require 'helpers/level_builder'
require 'helpers/phases_builder'
require 'helpers/level_builder'

$LOAD_PATH.unshift '.'
set :environment, :development

set :environment, :development

set :environment, :development

before do
  @rdf_repository = RDFRepository.new
  @level_builder = LevelBuilder.new @rdf_repository
  @phases_builder = PhasesBuilder.new @rdf_repository
end

get '/' do
  erb :index
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
  phases = %{
  {
  "phases": [
    {
      "id": "zvbc87h",
      "name": "Primary",
      "lower_age": 5,
      "upper_age": 11,
      "levels": [
      {
        "id": "zgckjxs",
        "name": "Early and 1st level",
        "description": "Early level is a phase of pre-school and primary education in Scotland, generally for pupils aged 3 to 6. First level is a phase of primary education in Scotland, generally for pupils aged 6 to 9.",
        "lower_age": 5,
        "upper_age": 11,
        "programmes_of_study": [ ]
      },
      {
      "id": "zvbc87h",
      "name": "KS2",
      "description": "Key Stage 2 is a phase of primary education for pupils aged 7 to 11 in England and Wales, or 8 to 11 in Northern Ireland.",
      "lower_age": 7,
      "upper_age": 11,
      "programmes_of_study": [ ]
      }
  ]
  },
  {
  "id": "zc9d7ty",
  "name": "Secondary",
  "lower_age": 11,
  "upper_age": 18,
  "levels": null
  }
  ]
  }
}
  phases
end

get '/education/phases/pack' do
  file = File.open('fixtures/pack.json', "rb")
  contents = file.read
  file.close

  contents
end
