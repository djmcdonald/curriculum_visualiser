class Level

  def initialize(name, lower_age, upper_age)
    @name = name
    @lower_age = lower_age
    @upper_age = upper_age
  end

  def hash
    { 'name' => @name, 'lower_age' => @lower_age, 'upper_age' => @upper_age}
  end
end