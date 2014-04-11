module Topical
  class Processor
    class Text
      class StripHtmlEntities < Text
        def transform
          input.gsub(/&[^;]+;/, '')
        end
      end
    end
  end
end
