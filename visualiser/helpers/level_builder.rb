require 'rdf'
require 'rdf/rdfxml'
require 'helpers/rdf_repository'
require 'model/rdf/levels'

class LevelBuilder
  CURRICULUM = RDF::Vocabulary.new("http://www.bbc.co.uk/ontologies/curriculum/")
  RDFS = RDF::Vocabulary.new('http://www.w3.org/2000/01/rdf-schema#')

  def initialize(rdfRepository)
    @rdfRepository = rdfRepository
  end

  def buildLevels
    levels = Levels.new

    reader = RDF::Reader.for(:rdfxml).new(@rdfRepository.levels)

    graph = RDF::Graph.new
    reader.each_statement { |statement| graph.insert statement }


    query = RDF::Query.new({
      :level => {
        RDF.type  => CURRICULUM.KeyStage,
        RDFS.label => :label,
        CURRICULUM.lowerAgeBoundary => :lowerAgeBoundary,
        CURRICULUM.upperAgeBoundary => :upperAgeBoundary
      }
    })

    query.execute(graph).each do |solution|
      levels.addLevel Level.new(solution.label.to_s,
                                solution.lowerAgeBoundary.to_i,
                                solution.upperAgeBoundary.to_i)

    end

    levels
  end
end