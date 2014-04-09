module Topical
  class Tokenizer
    attr_accessor :text, :words

    def initialize(text)
      self.text = text
    end

    def all
      preprocess

      split
      words
    end

    def preprocessors
      [:strip_html_tags, :strip_html_entities, :trim]
    end

    def preprocess
      self.text = preprocessors.inject(text) do |text, key|
        Topical.processor(key).new.process(text)
      end
    end

    def split
      @words = Topical.processor(:word_splitter).new.process(text)
    end
  end
end
