module Topical
  class Processor
    class Trim < Processor
      def transform
        text.gsub(/^\s+|\s+$/, '')
      end
    end
  end
end
