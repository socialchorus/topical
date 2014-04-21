module Topical
  module Splitter
    class Word < Processor
      def transform
        words = input.split(/[^\w+'\-&@#]+/)
        words.select {|word| word.length > 0 }
      end
    end
  end
end
