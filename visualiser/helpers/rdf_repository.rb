require 'rest_client'
require 'rdf'
require 'rdf/rdfxml'
#include RDF

class RDFRepository
  CURRICULUM = RDF::Vocabulary.new("http://www.bbc.co.uk/ontologies/curriculum/")
  RDFS = RDF::Vocabulary.new('http://www.w3.org/2000/01/rdf-schema#')

  def initialize
    RestClient.proxy = ENV['http_proxy']

  end

  def phases
    response = RestClient::Resource.new(
        'https://api.test.bbc.co.uk/ldp-knowlearn/education/levels',
        :ssl_client_cert  =>  OpenSSL::X509::Certificate.new(File.read("cert.pem")),
        :ssl_client_key   =>  OpenSSL::PKey::RSA.new(File.read("private.pem"), "password"),
        :verify_ssl       =>  OpenSSL::SSL::VERIFY_NONE
    ).get :content_type => 'application/rdf+xml', :accept => 'application/rdf+xml'

    rdf_reader = RDF::Reader.for(:rdfxml).new(response.body)
    graph = RDF::Graph.new
    rdf_reader.each_statement { |statement| graph.insert statement }

    solutions = RDF::Query.execute(
        {:queryhash => {
            RDF.type => CURRICULUM.TopicOfStudy,
            CURRICULUM.topics => :topic_of_study_list
        }}
    )

    solutions.each do |solution|
      puts solution.to_hash.inspect.to_s
    end
    s = solutions.size.to_s

    file = File.read 'fixtures/pack.json'
  end
end