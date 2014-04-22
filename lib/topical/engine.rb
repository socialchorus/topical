module Topical
  class Engine
    attr_accessor :input
    attr_reader :instructions

    def initialize(instructions, input=nil)
      @instructions = instructions
      @input = input
    end

    def run(i=nil)
      self.input = i if i

      instructions.inject(input) do |feed, key|
        tranformed = Topical.process(key, feed)
        log(key, tranformed) if Topical.debug
        tranformed
      end
    end

    def log(key, transformed)
      puts ":#{key} - #{transformed.inspect}"
    end
  end
end
