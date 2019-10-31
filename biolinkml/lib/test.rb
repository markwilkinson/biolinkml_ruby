require "./biolinkml.rb"

yaml = <<EOF
id: http://example.org/sample/example1
name: synopsis2
prefixes:
    foaf: http://xmlns.com/foaf/0.1/
    samp: http://example.org/model/
    xsd: http://www.w3.org/2001/XMLSchema#
    
default_prefix: samp

default_curi_maps:
    - semweb_context
    
default_range: string

types:
    string:
        base: str
        uri: xsd:string
        
classes:
    person:
        description: A person, living or dead
        slots:
            - id
            - first name
slots:
    id:
        description: Unique identifier of a person
        identifier: true

    first name:
        description: The first name of a person
        slot_uri: foaf:firstName
        multivalued: true
EOF

r = Biolinkml::Reader.new(yamlstring: yaml)
s = r.build_schema
puts r.inspect, "\n\n"
puts s.inspect
puts s.default_prefix.iri, " default"
puts s.class.default_prefix.iri, " class default"
puts s.class.prefixes['foaf']['thisthing'], " foaf this thing"
puts s.to_iri("samp:thingy")," samp thingy"
puts s.class.to_iri("foaf:marky"), " foaf marky"
puts s.class.to_iri("foal:marky"), " foal marky should fail"

