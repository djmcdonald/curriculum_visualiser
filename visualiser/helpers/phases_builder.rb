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

    reader = RDF::Reader.for(:rdfxml).new(@rdfRepository.phases)

    graph = RDF::Graph.new
    reader.each_statement { |statement| graph.insert statement }


    query = RDF::Query.new({
                               :level => {
                                   RDF.type  => CURRICULUM.Phase,
                                   RDFS.label => :label,
                                   CURRICULUM.lowerAgeBoundary => :lowerAgeBoundary,
                                   CURRICULUM.upperAgeBoundary => :upperAgeBoundary
                               }
                           })

    query.execute(graph).each do |solution|
      id = /(z[0-9a-z]{6})/.match(solution[:level].to_s)[0]
      phases.addPhase Phase.new(id,
                                solution.label.to_s,
                                solution.lowerAgeBoundary.to_i,
                                solution.upperAgeBoundary.to_i)

    end

    phases
  end
end