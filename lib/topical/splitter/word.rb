module Topical
  module Splitter
    class Word < Processor
      def type
        :splitter
      end

      def transform
        text.split(/[^\w+'-?]/)
      end
    end
  end
end
