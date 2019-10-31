
module Biolinkml
	  class Error < StandardError; 
	  end
	
	
	  class TypeDefinition < Biolinkml::Element

		attr_accessor :base # OPT String.  python base type that implements this type definition
		attr_accessor :repr # OPT String. the name of the python object that implements this type definition
		attr_accessor :uri # OPT Uri or curie.  The uri that defines the possible values for the type definition
		attr_accessor :typeof # OPT type definition. Names a parent type
		
		def initialize(args)
		  super(args)
		  
		  
		end
	
	
	
	  end
		
		  
end
