module Topical
  class Processor
    class StripHtmlTags < Processor
      def transform
        text.gsub(/<[^>]*>/, "")
      end
    end
  end
end
