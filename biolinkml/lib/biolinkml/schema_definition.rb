
module Biolinkml
	  class Error < StandardError; 
	  end
	
	
	  class SchemaDefinition < Biolinkml::Element

		attr_accessor :classes # 0..* ClassDefinition
		attr_accessor :default_curi_maps # 0..* string  (https://github.com/prefixcommons/biocontext)
		attr_accessor :default_prefix # OPT string default and base prefix -- used for ':' identifiers, @base and @vocab
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
		
		def initialize(args)
		  super(args)
		  @filename = args.fetch(:filename, nil)
		  @yamlstring  = args.fetch(:yamlstring, nil)
		  #$stderr.puts "got #{@filename} string #{@yamlstring}"
		  
		  @prefixes = Hash.new("nothing")
		  
		  unless defined?(@filename) || defined?(@string) 
			warn "you must give me a filename or a string of YAML to get started"
			return false
		  end
		  
		  begin
			yaml = self.parse()
			@yaml = yaml
		  rescue
			warn "YAML parsing failed.  Variable has not been set"
		  end
		  
		end
	
	
		def parse()
		   if self.filename
			 self.yaml = self.parsefile(self.filename)
		   elsif self.yamlstring
			 self.yaml = self.parsestring(self.yamlstring)
		   else
			 warn "not initialized with a filename or a string"
			 return false
		   end
		   
		   define_prefixes
		   define_types
		   
		   
		end
		
		
		
		def self.parsefile(filename)
	#TODO
	
		end
	
		def parsefile(filename)
	#TODO (see class method above)
		end
	
	
		def self.parsestring(yamlstring)
		  parsestring(yamlstring)
		end
		
		def parsestring(yamlstring)
		  yaml = YAML.load(yamlstring)
		  #yaml.inspect
		  return yaml
		end
		
		
		def define_prefixes
			prefs = self.yaml["prefixes"]
			default = self.yaml["default_prefix"]
			prefs.each do |prefix, val|
			  @prefixes[prefix] = RDF::Vocabulary.new(val)
			  if prefix == default
				@default_prefix = RDF::Vocabulary.new(val)
			  end
			end
		end
		
		
		def define_types
			types = self.yaml["types"]
			return false unless types
			types.each do |typename|
			  default = self.yaml["default_prefix"]
			  prefs.each do |prefix, val|
				@prefixes[prefix] = RDF::Vocabulary.new(val)
				if prefix == default
				  @default_prefix = RDF::Vocabulary.new(val)
				end
			  end
			end
		end
		
	
	  end
		
		  
end
