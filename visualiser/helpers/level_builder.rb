require 'rdf'
require 'rdf/rdfxml'
require 'helpers/rdf_repository'
require 'model/rdf/levels'
require 'model/rdf/programme_of_study'

class LevelBuilder
  CURRICULUM = RDF::Vocabulary.new("http://www.bbc.co.uk/ontologies/curriculum/")
  RDFS = RDF::Vocabulary.new('http://www.w3.org/2000/01/rdf-schema#')

  def initialize(rdfRepository)
    @rdfRepository = rdfRepository
  end

  def buildLevels

    levels = Levels.new

    early_level = Level.new(
        'zgckjxs',
        'Early and 1st level',
        'Early level is a phase of pre-school and primary education in Scotland, generally for pupils aged 3 to 6.  First level is a phase of primary education in Scotland, generally for pupils aged 6 to 9.',
        6,
        9
    )
    early_level.add_programme_of_study ProgrammeOfStudy.new
    levels.add_level early_level

    levels.add_level Level.new('zvbc87h', 'Key Stage 2 is a phase of primary education for pupils aged 7 to 11 in England and Wales, or 8 to 11 in Northern Ireland.', 'KS2', 7, 11)

    levels
  end
end