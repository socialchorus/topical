module Topical
  class Processor
    attr_accessor :text

    def initialize(text=nil)
      @text = text
    end

    def process(new_text=nil)
      self.text = new_text if new_text
      raise Topical::TextNotText unless text.is_a?(String)
      transform
    end

    def transform
      raise NotImplementedError
    end
  end
end
