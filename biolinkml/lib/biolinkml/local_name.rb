
module Biolinkml
	  class Error < StandardError; 
	  end
	
	
	  class LocalName
		attr_accessor :local_name_source # Ncname
		attr_accessor :local_name_value # string
		
		def initialize(args)
		  # super(args)
		  @local_name_source = args.fetch(:local_name_source, nil)
		  @local_name_value = args.fetch(:local_name_value, nil)

		end
		
	
	  end
		
		  
end
