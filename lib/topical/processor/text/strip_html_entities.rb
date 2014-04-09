module Topical
  class Processor
    module Text
      class StripHtmlEntities < Processor
        def type
          :text
        end

        def transform
          text.gsub(/&[^;]+;/, '')
        end
      end
    end
  end
end
