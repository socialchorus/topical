module Topical
  class Processor
    module Array
      class RemoveNumbers < Processor
        def transform
          input.select{|word| !word.match(/^[\d\.]+$/) }
        end
      end
    end
  end
end

