module Topical
  module Splitter
    class ExtractHashtags < Processor::Text
      def process(new_input=nil)
        super.flatten
      end

      def transform
        input.scan(hashtag_regex)
      end

      def hashtag_regex
        /#\w+/
      end
    end
  end
end