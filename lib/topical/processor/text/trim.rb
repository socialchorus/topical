module Topical
  class Processor
    class Text
      class Trim < Text
        def transform
          input.gsub(/^\s+|\s+$/, '')
        end
      end
    end
  end
end
