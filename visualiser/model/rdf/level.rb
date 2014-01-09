class Level

  def initialize(id, name, lower_age, upper_age)
    @id = id
    @name = name
    @lower_age = lower_age
    @upper_age = upper_age
  end

  def prepare_array
    { 'id' => @id, 'name' => @name, 'lower_age' => @lower_age, 'upper_age' => @upper_age}
  end
end