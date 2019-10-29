
module Biolinkml
	class Error < StandardError; 
	end
	
	
	class Example
	    attr_accessor :value
	    attr_accessor :description
	    
	    def initialize(args)
		# super(args)
		@value = args.fetch(:value, nil)
		@description = args.fetch(:description, nil)

	    end
	    
	
	end
		
		  
end
