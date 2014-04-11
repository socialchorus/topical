module Topical
  class Engine
    attr_reader :instructions, :input

    def initialize(input, instructions)
      @instructions = instructions
      @input = input
    end

    def run
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
