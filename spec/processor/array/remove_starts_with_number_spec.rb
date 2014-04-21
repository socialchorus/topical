require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::Array::RemoveStartsWithNumber do
  let(:processor) { Topical::Processor::Array::RemoveStartsWithNumber.new }
  let(:words) { ['at&t', '4g', 'lte']  }

  it "removes stopwords" do
    processor.process(words).must_equal ['at&t', 'lte']
  end
end
