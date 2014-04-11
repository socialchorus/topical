module Topical
  class Processor
    class Text
      class StripHtmlTags < Text
        def transform
          input.gsub(/<[^>]*>/, "")
        end
      end
    end
  end
end
