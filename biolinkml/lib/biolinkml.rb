#require "biolinkml/version"
require "safe_yaml"
require "rdf/vocab"

SafeYAML::OPTIONS[:default_mode] = :safe
SafeYAML::OPTIONS[:deserialize_symbols] = false


module Biolinkml
  class Error < StandardError; 
  end


  class Reader
    attr_accessor :filename
    attr_accessor :yamlstring
    attr_accessor :yaml  # parsed into a hash
    attr_accessor :namespaces
    
    def initialize(args)
      @filename = args.fetch(:filename, nil)
      @yamlstring  = args.fetch(:yamlstring, nil)
      #$stderr.puts "got #{@filename} string #{@yamlstring}"
      
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
    
    
    def prefixes
        prefs = self.yaml["prefixes"]
        pref.each do |prefix, val|
          puts prefix + "\t\t\t" + val
        end
        
        
    end
    

  end
    
      
end
