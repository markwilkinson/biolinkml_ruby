
module NilOnInitializationError
  # https://stackoverflow.com/questions/10692961/inheriting-class-methods-from-modules-mixins-in-ruby
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
