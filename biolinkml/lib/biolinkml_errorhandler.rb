
module NilOnInitializationError
  
  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def new_if_valid(args)
      self.new(args)
    rescue Biolinkml::InitializationError
      nil
    end
  end

  module ClassMethods
  end
end

module Biolinkml
  class InitializationError < StandardError
    #$stderr.puts "a required initialization parameter was not provided"
    nil
  end
end
