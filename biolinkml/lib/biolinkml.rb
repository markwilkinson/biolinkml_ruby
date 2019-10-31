#require "biolinkml/version"

require "safe_yaml"
require "rdf/vocab"

require "./biolinkml_errorhandler.rb"
require "./biolinkml/reader.rb"
require "./biolinkml/element.rb"
require "./biolinkml/definition.rb"
require "./biolinkml/schema_definition.rb"
require "./biolinkml/prefix.rb"
require "./biolinkml/type_definition.rb"
require "./biolinkml/subset_definition.rb"
require "./biolinkml/slot_definition.rb"
require "./biolinkml/alt_description.rb"
require "./biolinkml/example.rb"
require "./biolinkml/local_name.rb"
require "./biolinkml/class_definition.rb"


SafeYAML::OPTIONS[:default_mode] = :safe
SafeYAML::OPTIONS[:deserialize_symbols] = false
