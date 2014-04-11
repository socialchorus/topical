module Topical
  module Splitter
    class Word < Processor
      def transform
        input.split(/[^\w+'-?]+/)
      end
    end
  end
end
