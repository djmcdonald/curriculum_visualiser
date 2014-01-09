require 'json'
require 'model/rdf/level'

class Levels
  def initialize
    @levels = Array.new
  end

  def addLevel(level)
    @levels.push level.hash
  end

  def to_json
    { 'levels' => @levels }.to_json
  end
end