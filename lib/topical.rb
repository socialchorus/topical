require "topical/version"
require "topical/processor"
require "topical/registrar"
require "topical/stopwords"
require "topical/engine"

require "topical/processor/text"
require "topical/processor/text/strip_html_tags"
require "topical/processor/text/strip_html_entities"
require "topical/processor/text/trim"
require "topical/processor/text/downcase"

require "topical/splitter/word"
require "topical/splitter/extract_hashtags"

require "topical/processor/array/remove_stopwords"
require "topical/processor/array/remove_capitalized"
require "topical/processor/array/remove_lowercase"
require "topical/processor/array/remove_starts_with_number"
require "topical/processor/array/remove_numbers"
require "topical/processor/array/join_phrases"


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

  def self.process(key, input)
    Topical.processor(key).new.process(input)
  end

  class << self
    attr_accessor :debug
  end
end

Topical.register(:strip_html_entities,  Topical::Processor::Text::StripHtmlEntities)
Topical.register(:strip_html_tags,      Topical::Processor::Text::StripHtmlTags)
Topical.register(:trim,                 Topical::Processor::Text::Trim)
Topical.register(:downcase,             Topical::Processor::Text::Downcase)

Topical.register(:remove_stopwords,     Topical::Processor::Array::RemoveStopwords)
Topical.register(:remove_capitalized,   Topical::Processor::Array::RemoveCapitalized)
Topical.register(:remove_lowercase,     Topical::Processor::Array::RemoveLowercase)
Topical.register(:remove_starts_with_number,
                                        Topical::Processor::Array::RemoveStartsWithNumber)
Topical.register(:remove_numbers,       Topical::Processor::Array::RemoveNumbers)
Topical.register(:join_phrases,         Topical::Processor::Array::JoinPhrases)

Topical.register(:split_words,          Topical::Splitter::Word)
Topical.register(:extract_hashtags,     Topical::Splitter::ExtractHashtags)
