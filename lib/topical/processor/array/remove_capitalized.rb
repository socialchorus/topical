module Topical
  class Processor
    module Array
      class RemoveCapitalized < Processor
        def transform
          input.select{|word| word.downcase == word }
        end
      end
    end
  end
end

