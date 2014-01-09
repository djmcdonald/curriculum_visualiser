class Phase
  def initialize(id, name, lower_age, upper_age)
    @id = id
    @name = name
    @lower_age = lower_age
    @upper_age = upper_age

    @levels = Array.new
  end

  def add_levels(level)
    @levels.push level.prepare_array
  end

  def prepare_array
    {
        'id' => @id, 'name' => @name,
        'lower_age' => @lower_age,
        'upper_age' => @upper_age,
        'levels' => @levels
    }
  end
end