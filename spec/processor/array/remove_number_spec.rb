require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::Array::RemoveNumbers do
  let(:processor) { Topical::Processor::Array::RemoveNumbers.new }
  let(:words) { ['at&t', '4g', 'lte', '4.99']  }

  it "removes stopwords" do
    processor.process(words).must_equal ['at&t', '4g', 'lte']
  end
end
