require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Splitter::ExtractHashtags do
  let(:processor) { Topical::Splitter::ExtractHashtags.new(text) }
  let(:text) { '#scinsiders in cahoots with #attemployees' }

  it "finds them all" do
    processor.process.must_equal ['#scinsiders', '#attemployees']
  end
end
