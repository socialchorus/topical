require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::StripHtmlTags do
  let(:processor) { Topical::Processor::StripHtmlTags.new }

  let(:text) { '<a href="foo.com">go</a>' }

  it "should remove html tags" do
    processor.process(text).must_equal "go"
  end
end
