require "topical/version"
require "topical/tokenizer"
require "topical/processor"
require "topical/registrar"
require "topical/stopwords"
require "topical/filter"

require "topical/processor/text/strip_html_tags"
require "topical/processor/text/strip_html_entities"
require "topical/processor/text/trim"

require "topical/splitter/word"

module Topical
  class TextNotText < ArgumentError; end
  class ProcessorNotRegistered < ArgumentError; end

  def self.register(key, klass)
    registrar.add(key, klass)
  end

  def self.processor(key)
    registrar.get(key)
  end

  def self.registrar
    @registrar ||= Registrar.new
  end
end

Topical.register(:strip_html_entities,  Topical::Processor::Text::StripHtmlEntities)
Topical.register(:strip_html_tags,      Topical::Processor::Text::StripHtmlTags)
Topical.register(:trim,                 Topical::Processor::Text::Trim)

Topical.register(:word_splitter,        Topical::Splitter::Word)
