require 'json'
require 'model/rdf/phase'

class Phases
  def initialize
    @phases = Array.new
  end

  def add_phase(phase)
    @phases.push phase.prepare_array
  end

  def to_json
    { 'phases' => @phases }.to_json
  end
end