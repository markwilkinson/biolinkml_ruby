
module Biolinkml
	
	
	  class SchemaDefinition < Biolinkml::Element
		include NilOnInitializationError

		attr_accessor :classes # 0..* ClassDefinition
		attr_accessor :default_curi_maps # 0..* string  (https://github.com/prefixcommons/biocontext)
		#attr_accessor :default_prefix # OPT string default and base prefix -- used for ':' identifiers, @base and @vocab
		attr_accessor :default_range # OPT TypeDefinition
		attr_accessor :emit_prefixes # 0..* Ncname
		attr_accessor :generation_date # OPT datetime (owl)
		attr_accessor :id # REQUIRED URI
		attr_accessor :imports # 0..* URI or curie
		attr_accessor :license # OPT String (owl)
		attr_accessor :metamodel_version # OPT string (owl)
		attr_accessor :prefixes # 0..* Prefix
		attr_accessor :schema_definition➞slots # 0..* SlotDefinition
		attr_accessor :source_file # OPT string (owl)
		attr_accessor :source_file_date # OPT datetime (owl)
		attr_accessor :source_file_size # OPT integer (owl)
		attr_accessor :subsets # 0..* SubsetDefinition
		attr_accessor :title # OPT string (owl)
		attr_accessor :types # 0..* TypeDefinition
		attr_accessor :version #OPT string

		IRIPATTERN = Regexp.new(/\w+:(\/?\/?)[^\s]+/)
		@@default_prefix = nil
		@@prefixes = Hash.new()
		@@types = Hash.new()
		
		def initialize(args)
			super(args)
			@id = args.fetch(:id, nil)
			
			return false unless IRIPATTERN.match(@id)

	  
			# TODO default_curi_maps = args.fetch(:default_curi_maps)
			# TODO default_range = args.fetch(:default_range)
	
			@name = args.fetch(:name, "unnamed")
			prefixes = args.fetch(:prefixes, [])
			define_prefixes(prefixes)
			self.default_prefix= args.fetch(:default_prefix, nil)
			
			types = args.fetch(:types, [])
			define_types(types)
			
			slots = args.fetch(:slots, [])
			#define_slots(slots)
			
			classes = args.fetch(:classes, [])
			#define_classes(classes)
	  

				  
		end
	


		# -----------------------------------   HEADER STUFF -----------------
		# -----------------------------------   HEADER STUFF -----------------
		# -----------------------------------   HEADER STUFF -----------------
		# -----------------------------------   HEADER STUFF -----------------
		# -----------------------------------   HEADER STUFF -----------------

		def define_prefixes(prefs)
			prefs.each do |prefix, val|
			  @@prefixes[prefix] = RDF::Vocabulary.new(val)
			end
		end
		def prefixes
			@@prefixes
		end
		
		def self.prefixes
			@@prefixes
		end
		
		
		
		def default_prefix
			@@default_prefix
		end
		def default_prefix=(value)
			self.class.default_prefix=value
		end
		def self.default_prefix
			@@default_prefix
		end
		def self.default_prefix=(value)
			puts "setting default prefix to #{value}"
			puts self.prefixes.inspect
			
			return false if value.nil? or value.empty?
			
			if  self.prefixes[value]
				@@default_prefix = self.prefixes[value]   # tis is an RDF::Vocabulary node
				@@default_prefix
			else
				warn "the default prefix #{value} was not defined as a prefix, therefore I cannot set the default prefix"
				return false
			end
		end

		def define_types(types)
			    #string:
				#base: str
				#uri: xsd:string

			return false unless types
			types.each do |typename|
				#type


			end
		end

		
		# -----------------------------------   END OF HEADER STUFF -----------------
		# -----------------------------------   END OF HEADER STUFF -----------------
		# -----------------------------------   END OF HEADER STUFF -----------------
		# -----------------------------------   END OF HEADER STUFF -----------------
		# -----------------------------------   END OF HEADER STUFF -----------------
		# -----------------------------------   END OF HEADER STUFF -----------------
		
		
		
		# -----------------------------------   MEAT 'N POTATOES     -----------------
		# -----------------------------------   MEAT 'N POTATOES     -----------------
		# -----------------------------------   MEAT 'N POTATOES     -----------------
		# -----------------------------------   MEAT 'N POTATOES     -----------------
		
		








		# -----------------------------------   END MEAT 'N POTATOES  -----------------
		# -----------------------------------   END MEAT 'N POTATOES  -----------------
		# -----------------------------------   END MEAT 'N POTATOES  -----------------
		# -----------------------------------   END MEAT 'N POTATOES  -----------------
		# -----------------------------------   END MEAT 'N POTATOES  -----------------
		# -----------------------------------   END MEAT 'N POTATOES  -----------------









		# -----------------------------------   HELPFUL TOOLS  -----------------
		# -----------------------------------   HELPFUL TOOLS  -----------------
		# -----------------------------------   HELPFUL TOOLS  -----------------
		
		def to_iri(thingy)
			self.class.to_iri(thingy)
		end
		
		def self.to_iri(thingy)
			# thingy is either a curi or an iri
			# this will convert it to a full iri
			if IRIPATTERN.match(thingy)
				prefix, localid = thingy.split(":")
				if prefix.to_s.downcase =~ /https?/
					puts "defined as https"
					return thingy
				elsif self.prefixes[prefix.to_s]
					puts "defined prefix"
					return self.prefixes[prefix.to_s][localid.to_s]
				else
					warn "this prefix was not defined.  Using default instead, but this may break you!"
					return self.default_prefix[localid.to_s]
				end
			end
		end
		# -----------------------------------   END HELPFUL TOOLS  -----------------
		# -----------------------------------   END HELPFUL TOOLS  -----------------
		# -----------------------------------   END HELPFUL TOOLS  -----------------
		# -----------------------------------   END HELPFUL TOOLS  -----------------

	
	  end
		
		  
end
