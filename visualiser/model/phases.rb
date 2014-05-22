require 'json'

class Phases
  def initialize
    @phases = Array.new
  end

  def add_phase(phase)
    @phases.push phase
  end

  def json
    {
        "name" => "Levels",
        "children" => @phases
    }.to_json
  end
end