require 'json'
require 'model/rdf/level'

class Levels
  def initialize
    @levels = Array.new
  end

  def add_level(level)
    @levels.push level.prepare_array
  end

  def prepare_array
    @levels
  end

  def to_json
    { 'levels' => @levels }.to_json
  end
end