module Topical
  class Stopwords
    attr_accessor :words

    def initialize
      @words = []
    end

    def load(path)
      new_collection = words + split_words_on(path)
      self.words = new_collection.map {|word| trim(word) }.uniq.sort
    end

    def split_words_on(path)
      path =  stopwords_path(path) if path.is_a?(Symbol)
      File.read(path).split(/,\s?/)
    end

    def trim(word)
      Topical.processor(:trim).new(word).process
    end

    def stopwords_path(key)
      File.dirname(__FILE__) + "/stopwords/#{key}.csv"
    end
  end
end
