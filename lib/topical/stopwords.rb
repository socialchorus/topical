module Topical
  class Stopwords
    attr_accessor :words

    def initialize
      @words = []
    end

    def load(path)
      path =  stopwords_path(path) if path.is_a?(Symbol)
      split = File.read(path).split(/,\s?/)
      self.words += split
      self.words = words.map {|word| trim(word) }.uniq
    end

    def trim(word)
      Processor::Trim.new(word).process
    end

    def stopwords_path(key)
      File.dirname(__FILE__) + "/stopwords/#{key}.csv"
    end
  end
end
