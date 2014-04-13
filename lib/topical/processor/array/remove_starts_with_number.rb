module Topical
  class Processor
    module Array
      class RemoveStartsWithNumber < Processor
        def transform
          input.select{|word| !word.match(/^\d/) }
        end
      end
    end
  end
end

