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

p = Biolinkml::Reader.new(yamlstring: yaml)
y = p.parse
y.is_a?(Array)

pref = p.prefixes

pref.each do |prefix, val|
	puts prefix + "\t\t\t" + val.to_s
end

puts p.default_prefix.to_s