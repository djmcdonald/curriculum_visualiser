class RDFRepository
  def levels
    File.read("fixtures/stage_levels.rdf.xml")
  end
end