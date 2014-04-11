require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::Array::RemoveStopwords do
  let(:processor) { Topical::Processor::Array::RemoveStopwords.new }
  let(:words) { ["the", "quick", "brown", "fox", "jumped"]  }

  it "removes stopwords" do
    processor.process(words).must_equal ['quick', 'brown', 'fox', 'jumped']
  end
end
