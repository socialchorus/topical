require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::Text::StripHtmlEntities do
  let(:processor) { Topical::Processor::Text::StripHtmlEntities.new }

  let(:text) { 'a&#768; pleasant hello' }

  it "should remove html tags" do
    processor.process(text).must_equal "a pleasant hello"
  end
end

