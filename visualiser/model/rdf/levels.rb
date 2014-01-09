require 'json'

class Levels
  def levels
    "KS3"
  end

  def to_json
    { 'levels' => { 'level' => { 'name' => 'Primary' } } }.to_json
  end
end