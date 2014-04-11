module Topical
  class Processor
    class Text
      class Downcase < Text
        def transform
          input.downcase
        end
      end
    end
  end
end

