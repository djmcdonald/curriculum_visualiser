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

    early_level = Level.new 'zgckjxs', 'Early and 1st level', 5, 11
    ks2 = Level.new 'zvbc87h', 'KS2', 7, 11
    primary_levels = Levels.new
    primary_levels.addLevel early_level
    primary_levels.addLevel ks2

    primary_phase = Phase.new 'zvbc87h', 'Primary', 5, 11
    primary_phase.addLevels primary_levels
    phases.addPhase primary_phase

    secondary_phase = Phase.new 'zc9d7ty', 'Secondary', 11, 18
    phases.addPhase secondary_phase

    phases
  end
end