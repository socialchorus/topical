module Topical
  class Processor
    module Text
      class Trim < Processor
        def type
          :text
        end

        def transform
          text.gsub(/^\s+|\s+$/, '')
        end
      end
    end
  end
end
