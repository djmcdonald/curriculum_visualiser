require 'json'

class Levels
  @levels = Array.new

  def addLevel(level)

  end

  def levels
    "KS3"
  end

  def to_json
    { 'levels' => [
        { 'name' => 'Primary' },
        { 'name' => 'Secondary' }
    ] }.to_json
  end
end