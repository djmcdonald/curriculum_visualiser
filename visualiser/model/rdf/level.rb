class Level
  @name = "KS3"
  @lower_age = 7
  @upper_age = 14

  def hash
    instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
  end
end