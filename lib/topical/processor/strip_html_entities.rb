module Topical
  class Processor
    class StripHtmlEntities < Processor
      def transform
        text.gsub(/&[^;]+;/, '')
      end
    end
  end
end
