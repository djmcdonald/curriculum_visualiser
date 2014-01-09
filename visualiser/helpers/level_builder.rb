require 'rdf'
require 'model/rdf/levels'

class LevelBuilder
  def initialize(rdfRepository)
    @rdfRepository = rdfRepository
  end

  def buildLevels
    Levels.new
  end
end