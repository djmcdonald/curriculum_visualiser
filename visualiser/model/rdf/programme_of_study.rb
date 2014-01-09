class ProgrammeOfStudy
  def initialize(name)
    @name = name
  end

  def prepare_array
    { 'name' => @name }
  end
end
