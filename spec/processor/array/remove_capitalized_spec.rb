require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::Array::RemoveCapitalized do
  let(:processor) { Topical::Processor::Array::RemoveCapitalized.new }
  let(:words) { ["The", "quick", "brown", "fox", "jumped"]  }

  it "removes stopwords" do
    processor.process(words).must_equal ['quick', 'brown', 'fox', 'jumped']
  end
end
