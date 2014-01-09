require 'json'
require 'model/rdf/level'

class Levels

  def initialize
    @levels = Array.new
  end

  def addLevel(level)

  end

  def to_json
    @levels.push Level.new.hash
    @levels.push Level.new.hash

    { 'levels' => @levels }.to_json
  end
end