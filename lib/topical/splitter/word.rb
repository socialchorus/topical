module Topical
  module Splitter
    class Word < Processor
      def transform
        words = input.split(/[^\w+'\-&]+/)
        words.select {|word| word.length > 1 }
      end
    end
  end
end
