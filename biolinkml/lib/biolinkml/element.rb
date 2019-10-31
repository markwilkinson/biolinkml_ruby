module Biolinkml
	
	
	  class Element
		include NilOnInitializationError
		
		attr_accessor :aliases #0..* string
		#TODO attr_accessor :alt_descriptions #0..* alt_description
		# TODO attr_accessor :close_mappings # 0..* URI or curie
		attr_accessor :comments #0..* string (owl)
		attr_accessor :definition_uri # OPT URI or curie
		attr_accessor :deprecated # OPT string
		# TODO attr_accessor :deprecated_element_has_exact_replacement # OPT URI or curie
		# TODO attr_accessor :deprecated_element_has_possible_replacement # OPT URI or curie
		attr_accessor :description # OPT string (owl)
		# TODO attr_accessor :exact_mappings # 0..* URI or curie
		attr_accessor :examples # 0..* Example (owl)
		attr_accessor :from_schema #OPT Uri
		attr_accessor :id_prefixes # 0..* Ncname
		attr_accessor :imported_from # OPT string
		# TODO attr_accessor :in_subset # 0..* SubsetDefinition
		attr_accessor :local_names # 0..* LocalName
		# TODO attr_accessor :mappings # 0..* URU or curie
		attr_accessor :name # REQ String (owl)
		attr_accessor :notes # 0..* String (owl)
		# TODO attr_accessor :related_mappings # 0..* URI or curie
		attr_accessor :see_also # 0..* URI or curie (owl)
		# TODO attr_accessor :todos # 0..* string

		def new_if_valid(args)
			self.new(args)
		rescue Biolinkml::InitializationError
			$stderr.puts "rescuing with nil"
			nil
		end

		def initialize(args)

		  # REQUIRED
		  @name = args.fetch(:name, nil)
		  unless @name
			  raise Biolinkml::InitializationError.new "cannot create this object without a valid name"
		  end

		  # OPTIONAL
		  @aliases = args.fetch(:aliases, [])
		  # TODO @alt_descriptions = args.fetch(:alt_descriptions, [])
		  # TODO @close_mappings = args.fetch(:close_mappings, [])
		  @comments = args.fetch(:comments, [])
		  @definition_uri = args.fetch(:definition_uri, nil)
		  # TODO @deprecated_element_has_exact_replacement = args.fetch(:deprecated_element_has_exact_replacement, nil)
		 # TODO  @deprecated_element_has_possible_replacement = args.fetch(:deprecated_element_has_possible_replacement, nil)
		  @description = args.fetch(:description, nil)
		  # TODO @exact_mappings = args.fetch(:exact_mappings, [])
		  @examples = args.fetch(:examples, [])
		  @from_schema = args.fetch(:from_schema, nil)
		  @id_prefixes = args.fetch(:id_prefixes, [])
		  @imported_from = args.fetch(:imported_from, nil)
		  # TODO @in_subset = args.fetch(:in_subset, [])
		  @local_names = args.fetch(:local_names, [])
		  # TODO  mappings = args.fetch(:mappings, [])
		  @notes = args.fetch(:notes, [])
		  # TODO related_mappings = args.fetch(:related_mappings, [])
		  @see_also = args.fetch(:see_also, [])
		  # TODO todos = args.fetch(:todos, [])
		  
		  @aliases = [@aliases] unless @aliases.is_a?(Array)
		  @comments = [@comments] unless @comments.is_a?(Array)
		  @examples = [@examples] unless @examples.is_a?(Array)
		  @id_prefixes = [@id_prefixes] unless @id_prefixes.is_a?(Array)
		  @local_names = [@local_names] unless @local_names.is_a?(Array)
		  @notes = [@notes] unless @notes.is_a?(Array)
		  @see_also = [@see_also] unless @see_also.is_a?(Array)
		  
		  @examples.each do |e|
			@examples.delete(e) unless e.is_a?(Biolinkml::Example)
		  end
		  @local_names.each do |e|
			@local_names.delete(e) unless e.is_a?(Biolinkml::LocalName)
		  end





		end
		
		
	  end
end
