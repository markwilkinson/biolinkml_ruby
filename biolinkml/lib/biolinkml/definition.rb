
module Biolinkml
	  class Error < StandardError; 
	  end
	
	
	  class Definition < Biolinkml::Element

		attr_accessor :abstract # OPT Boolean
		attr_accessor :apply_to # 0..* Definition.  Used to extend class or slot definitions. For example, if we have a core schema where a gene has two slots for identifier and symbol, and we have a specialized schema for my_organism where we wish to add a slot systematic_name, we can avoid subclassing by defining a class gene_my_organism, adding the slot to this class, and then adding an apply_to pointing to the gene class. The new slot will be 'injected into' the gene class.
		attr_accessor :is_a # OPT Definition. specifies single-inheritance between classes or slots. While multiple inheritance is not allowed, mixins can be provided effectively providing the same thing. The semantics are the same when translated to formalisms that allow MI (e.g. RDFS/OWL). When translating to a SI framework (e.g. java classes, python classes) then is a is used. When translating a framework without polymorphism (e.g. json-schema, solr document schema) then is a and mixins are recursively unfolded
		attr_accessor :mixin # OPT Boolean.  this slot or class can only be used as a mixin -- equivalent to abstract
		attr_accessor :mixins # 0..* Definition. List of definitions to be mixed in. Targets may be any definition of the same type
		attr_accessor :values_from # 0..* URI or curie. The identifier of a "value set" -- a set of identifiers that form the possible values for the range of a slot
		
		def initialize(args)
		  super(args)
		  @abstract = args.fetch(:abstract, false)
		  @apply_to = args.fetch(:apply_to, [])
		  @is_a = args.fetch(:is_a, nil)
		  @mixin = args.fetch(:mixin, false)
		  @mixins = args.fetch(:mixins, [])
		  @values_from = args.fetch(:values_from, [])
		  
		  @apply_to = [@apply_to] unless @apply_to.is_a?(Array)
		  @mixins = [@mixins] unless @mixins.is_a?(Array)
		  @values_from = [@values_from] unless @values_from.is_a?(Array)
		  
		  @apply_to = true if @apply_to == 1
		  @apply_to = false if @apply_to == 0
		  
		  @mixins = true if @mixins == 1
		  @mixins = false if @mixins == 0
		  
		  @apply_to.each do |a|
			  @apply_to.delete(a) unless a.is_a?(Biolinkml::Definition)
		  end
		  
		  @mixins.each do |a|
			  @mixins.delete(a) unless a.is_a?(Biolinkml::Definition)
		  end

		  @is_a = nil unless @is_a.is_a?(Biolinkml::Definition)
		  


		  
		end
	
	
	
	  end
		
		  
end
