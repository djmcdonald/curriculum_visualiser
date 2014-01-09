require 'json'
require 'model/rdf/phase'

class Phases
  def initialize
    @phases = Array.new
  end

  def addPhase(phase)
    @phases.push phase.hash
  end

  def to_json
    { 'phases' => @phases }.to_json
  end
end