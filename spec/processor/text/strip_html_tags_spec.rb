require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::Text::StripHtmlTags do
  let(:processor) { Topical::Processor::Text::StripHtmlTags.new }

  let(:text) { '<a href="foo.com">go</a>' }

  it "should remove html tags" do
    processor.process(text).must_equal "go"
  end
end
