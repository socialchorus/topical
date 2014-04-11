module Topical
  class Processor
    module Array
      class RemoveStopwords < Processor
        def transform
          input - stopwords
        end

        def stopwords
          return @stopwords if @stopwords

          file_selectors.each do |key|
            stopworder.load(key)
          end
          @stopwords = stopworder.words
        end

        def stopworder
          @stopworder ||= Topical::Stopwords.new
        end

        def file_selectors
          [:en]
        end
      end
    end
  end
end
