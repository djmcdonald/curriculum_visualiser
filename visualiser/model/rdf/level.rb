class Level

  def initialize(id, name, description, lower_age, upper_age)
    @id = id
    @name = name
    @description = description
    @lower_age = lower_age
    @upper_age = upper_age
  end

  def add_programme_of_study(programme_of_study)

  end

  def prepare_array
    { 'id' => @id, 'name' => @name, 'description' => @description, 'lower_age' => @lower_age, 'upper_age' => @upper_age}
  end
end