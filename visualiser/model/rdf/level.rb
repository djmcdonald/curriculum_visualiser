class Level

  def initialize
    @name = "KS3"
    @lower_age = 7
    @upper_age = 14
  end

  def hash
    { 'name' => @name, 'lower_age' => @lower_age, 'upper_age' => @upper_age}
  end
end