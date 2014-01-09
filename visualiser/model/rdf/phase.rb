class Phase
  def initialize(id, name, lower_age, upper_age)
    @id = id
    @name = name
    @lower_age = lower_age
    @upper_age = upper_age

    @levels
  end

  def add_levels(level)
    @levels = level.prepare_array
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