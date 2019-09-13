#require "biolinkml/version"
require "safe_yaml"

SafeYAML::OPTIONS[:default_mode] = :safe
SafeYAML::OPTIONS[:deserialize_symbols] = false


module Biolinkml
  class Error < StandardError; end
  # Your code goes here...
  
  class Reader
    attr_accessor :filename
    attr_accessor :yamlstring
    attr_accessor :yaml  # parsed into a hash
    
    def initialize(args)
      @filename = args.fetch(:filename, nil)
      @yamlstring  = args.fetch(:yamlstring, nil)
      #$stderr.puts "got #{@filename} string #{@yamlstring}"
      
      unless defined?(@filename) || defined?(@string) 
        warn "you must give me a filename or a string of YAML to get started"
        return false
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

    end



    def self.parsestring(yamlstring)
      yaml = YAML.load(yamlstring)
      yaml.inspect
       
    end



    def parsefile(filename)

    end



    def parsestring(yamlstring)
      yaml = YAML.load(yamlstring)
      puts  yaml.inspect
      return yaml 
    end

  end
    
      
end
