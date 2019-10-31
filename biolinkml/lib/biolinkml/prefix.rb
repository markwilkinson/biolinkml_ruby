module Biolinkml
	  class Error < StandardError; 
	  end
	
	
	  class Prefix
		attr_accessor :prefix_prefix # Ncname
		attr_accessor :prefix_reference # URI
		
		def initialize(args)
		  # super(args)
		  @prefix_prefix = args.fetch(:prefix_prefix, nil)
		  @prefix_reference = args.fetch(:prefix_reference, nil)

		end
		
	
	  end
		
		  
end
