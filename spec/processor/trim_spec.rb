require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::StripHtmlTags do
  let(:processor) { Topical::Processor::Trim.new }

  let(:text) { '   go team, or whatever!    ' }

  it "should remove html tags" do
    processor.process(text).must_equal "go team, or whatever!"
  end
end

