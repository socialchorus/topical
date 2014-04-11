module Topical
  class Processor
    class Text < Processor
      def process(new_input=nil)
        self.input = new_input if new_input

        if input.respond_to?(:map)
          transform_array
        else
          transform
        end
      end

      def transform_array
        array_input = input.dup
        array_input.map do |i|
          self.input = i
          transform
        end
      end
    end
  end
end
