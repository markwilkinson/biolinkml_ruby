
module Biolinkml
	  class Error < StandardError; 
	  end
	
	
	  class ClassDefinition < Biolinkml::Definition

		attr_accessor :apply_to # 0..* ClassDefinition
		attr_accessor :is_a # OPT ClassDefinition
		attr_accessor :mixins # 0..* ClassDefinition
		attr_accessor :class_uri # OPT URI or curie # URI of the class in an RDF environment
		attr_accessor :defining_slots # 0..* SlotDefinition The combination of is a plus defining slots form a genus-differentia definition, or the set of necessary and sufficient conditions that can be transformed into an OWL equivalence axiom
		attr_accessor :slot_usage # 0..* SlotDefinition.  the redefinition of a slot in the context of the containing class definition.
		attr_accessor :slots # 0..*.  SlotDefinition list of slot names that are applicable to a class
		attr_accessor :subclass_of # OPT URI or Curie rdfs:subClassOf to be emitted in OWL generation
		attr_accessor :union_of # 0..* Class_Definition. indicates that the domain class consists exactly of the members of the classes in the range
		
		def initialize(args)
			super(args)
			
			@apply_to = args.fetch(:apply_to, [])
			@is_a = args.fetch(:is_a, nil)
			@mixins = args.fetch(:mixins, [])
			@class_uri = args.fetch(:class_uri, nil)
			@defining_slots = args.fetch(:defining_slots, [])
			@slot_usage = args.fetch(:slot_usage, [])
			@slots = args.fetch(:slots, [])
			@subclass_of = args.fetch(:subclass_of, nil)
			@union_of = args.fetch(:union_of, [])

			@apply_to = [@apply_to] unless @apply_to.is_a?(Array)
			@mixins = [@mixins] unless @mixins.is_a?(Array)
			@defining_slots = [@defining_slots] unless @defining_slots.is_a?(Array)
			@slot_usage = [@slot_usage] unless @slot_usage.is_a?(Array)
			@slots = [@slots] unless @slots.is_a?(Array)
			@union_of = [@union_of] unless @union_of.is_a?(Array)
			
			@apply_to = nil unless @apply_to.is_a?(Biolinkml::ClassDefinition)
			@is_a = nil unless @is_a.is_a?(Biolinkml::Definition)
			
			@apply_to.each do |a|
				@apply_to.delete(a) unless a.is_a?(Biolinkml::ClassDefinition)
			end
			@mixins.each do |a|
				@mixins.delete(a) unless a.is_a?(Biolinkml::ClassDefinition)
			end
			@defining_slots.each do |a|
				@defining_slots.delete(a) unless a.is_a?(Biolinkml::SlotDefinition)
			end
			@slot_usage.each do |a|
				@slot_usage.delete(a) unless a.is_a?(Biolinkml::SlotDefinition)
			end
			@slots.each do |a|
				@slots.delete(a) unless a.is_a?(Biolinkml::SlotDefinition)
			end
			@union_of.each do |a|
				@union_of.delete(a) unless a.is_a?(Biolinkml::ClassDefinition)
			end
			
		  		 
		end
		
	
	  end
		
end
