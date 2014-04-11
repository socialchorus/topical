module Topical
  class Processor
    attr_accessor :input

    def initialize(input=nil)
      @input = input
    end

    def process(new_input=nil)
      self.input = new_input if new_input
      transform
    end

    def transform
      raise NotImplementedError
    end
  end
end
