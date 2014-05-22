require 'rest_client'
require 'rdf'
require 'rdf/rdfxml'
require 'rdf/json'
require 'model/phases'
#include RDF

class RDFRepository
  CURRICULUM = RDF::Vocabulary.new("http://www.bbc.co.uk/ontologies/curriculum/")
  RDFS = RDF::Vocabulary.new('http://www.w3.org/2000/01/rdf-schema#')
  OWL = RDF::Vocabulary.new('http://www.w3.org/2002/07/owl#')

  def initialize
    RestClient.proxy = ENV['http_proxy']

  end

  def phases
    response = RestClient::Resource.new(
        ':endpoint',
        :ssl_client_cert  =>  OpenSSL::X509::Certificate.new(File.read("cert.pem")),
        :ssl_client_key   =>  OpenSSL::PKey::RSA.new(File.read("private.pem"), "password"),
        :verify_ssl       =>  OpenSSL::SSL::VERIFY_NONE
    ).get :content_type => 'application/rdf+json', :accept => 'application/rdf+json'

    @phases = Phases.new

    rdf_reader = RDF::Reader.for(:json).new(response.body)
    graph = RDF::Graph.new
    rdf_reader.each_statement { |statement| graph.insert statement }

    query = RDF::Query.new(:level => {
        RDF.type  => CURRICULUM.Phase,
        RDFS.label => :label
    })

    results = query.execute(graph)

    results.map { |result|
      puts "****** #{result.label.to_s}"
    }

    File.read 'fixtures/pack.json'
    #@phases.json
  end
end