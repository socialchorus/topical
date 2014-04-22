module Topical
  class Processor
    module Array
      class JoinPhrases < Processor
        def transform
          detect_phrases
          while !joins.empty?
            join
            detect_phrases
          end
          input
        end

        def detect_phrases
          input.each_with_index do |first_occurence, i|
            next unless counts[first_occurence] && counts[first_occurence] > 1

            input[(i+1)..(-1)].each_with_index do |next_occurence, n|
              next unless first_occurence == next_occurence
              if input[i+1] == input[i+n+2]
                joins << [i, i+1]
                joins << [i+n+1, i+n+2]
              end
            end

            break unless joins.empty?
          end
        end

        def join
          joins.uniq.each_with_index do |locations, offset|
            input[locations.first - offset] = input[locations.first - offset] + ' ' + input[locations.last - offset]
            input.delete_at(locations.last - offset)
          end
          clear_data
        end

        def clear_data
          joins.clear
          @counts = nil
        end

        def joins
          @joins ||= []
        end

        def counts
          @counts ||= _counts.inject({}) do |hash, key_val|
            hash[key_val[0]] = key_val[1] if key_val[1] > 1
            hash
          end
        end

        def _counts
          input.inject(Hash.new(0)) do |hash, word|
            hash[word] += 1
            hash
          end
        end
      end
    end
  end
end

