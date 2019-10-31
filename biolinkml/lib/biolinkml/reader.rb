SafeYAML::OPTIONS[:default_mode] = :safe
SafeYAML::OPTIONS[:deserialize_symbols] = false




module Biolinkml
 

  class Reader

  	include ::NilOnInitializationError

    attr_accessor :filename
    attr_accessor :yamlstring
    attr_accessor :yaml  # parsed into a hash
    
    
    
    def initialize(args)
      @filename = args.fetch(:filename, nil)
      @yamlstring  = args.fetch(:yamlstring, nil)
            
      unless defined?(@filename) || defined?(@string)
        raise InitializationError.new "you must give me a filename or a string of YAML to get started"
      end

      
      
      
    end

    
    def build_schema
      begin
        @yaml = self.parse()
      rescue
        warn "YAML parsing failed.  Variable has not been set"
      end
      
      schema = Biolinkml::SchemaDefinition.new_if_valid({
        id: @yaml['id'],
        #name: @yaml['name'],
        prefixes: @yaml['prefixes'],
        default_prefix: @yaml['default_prefix'],
        default_curi_maps: @yaml['default_curi_maps'],
        default_range: @yaml['default_range'],
        types: @yaml['types'],
        classes: @yaml['classes'],
        slots: @yaml['slots']
      })
      
      return schema
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

  end
    
      
end
