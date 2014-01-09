class Level

  def initialize(id, name, description, lower_age, upper_age)
    @programmes_of_study = Array.new
    @id = id
    @name = name
    @description = description
    @lower_age = lower_age
    @upper_age = upper_age
  end

  def add_programme_of_study(programme_of_study)
    @programmes_of_study.push programme_of_study.prepare_array
  end

  def prepare_array
    {
      'id' => @id,
      'name' => @name,
      'description' => @description,
      'lower_age' => @lower_age,
      'upper_age' => @upper_age,
      'programmes_of_study' => @programmes_of_study
    }
  end
end