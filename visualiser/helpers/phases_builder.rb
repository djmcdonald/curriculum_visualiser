require 'rdf'
require 'rdf/rdfxml'
require 'helpers/rdf_repository'
require 'model/rdf/phases'

class PhasesBuilder
  CURRICULUM = RDF::Vocabulary.new("http://www.bbc.co.uk/ontologies/curriculum/")
  RDFS = RDF::Vocabulary.new('http://www.w3.org/2000/01/rdf-schema#')

  def initialize(rdfRepository)
    @rdfRepository = rdfRepository
  end

  def buildPhases
    phases = Phases.new

    early_level = Level.new 'zgckjxs', 'Early and 1st level', 'Early level is a phase of pre-school and primary education in Scotland, generally for pupils aged 3 to 6.  First level is a phase of primary education in Scotland, generally for pupils aged 6 to 9.', 5, 11
    ks2 = Level.new 'zvbc87h', 'Key Stage 2 is a phase of primary education for pupils aged 7 to 11 in England and Wales, or 8 to 11 in Northern Ireland.', 'KS2', 7, 11
    primary_levels = Levels.new
    primary_levels.add_level early_level
    primary_levels.add_level ks2

    primary_phase = Phase.new 'zvbc87h', 'Primary', 5, 11
    primary_phase.add_levels primary_levels
    phases.add_phase primary_phase

    secondary_phase = Phase.new 'zc9d7ty', 'Secondary', 11, 18
    phases.add_phase secondary_phase

    phases
  end
end