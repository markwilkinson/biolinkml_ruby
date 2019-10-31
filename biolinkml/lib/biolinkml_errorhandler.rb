
module NilOnInitializationError 
  def new_if_valid(args)
    self.new(args)
  rescue Biolinkml::InitializationError
		nil
  end
end

module Biolinkml
  class InitializationError < StandardError
    #$stderr.puts "a required initialization parameter was not provided"
    nil
  end
end
