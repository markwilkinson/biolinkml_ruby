module Biolinkml
  class Error < StandardError; end
  # Your code goes here...
  
  class OM
    attr_accessor :yaml
    attr_accessor :id
    attr_accessor :name
    attr_accessor :prefixes  # parsed into a hash
    attr_accessor :default_prefix
    attr_accessor :default_curi_maps
    attr_accessor :default_range
    attr_accessor :types
    
    
    attr_accessor :classes
    attr_accessor :slots

    def initialize(args)
      @yaml = args.fetch(:yaml, "")
      self.extract_classes
      self.extract_slots
      
      
    end
    
    
    def extract_classes()
      classes = self.yaml['classes'].keys
      classes.each do |c|
        define_new_class(c) do
          attr_accessor :my_accessor_1
        
          def initialize
            puts "Hello"
          end
        end
      end
      
      
    end
    
    
    def extract_slots()
    end
    
    
    def define_new_class(name, &block)
      new_class = Class.new do
        self.instance_eval(&block)
      end
      Object.const_set(name, new_class)
    end
    
  end
end
