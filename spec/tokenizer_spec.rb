require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Tokenizer do
  let(:tokenizer) { Topical::Tokenizer.new(text) }

  describe 'when there is just normal words' do
    let(:text) { 'hello there' }

    it "returns an array of the individual strings" do
      tokenizer.all.must_equal ['hello', 'there']
    end
  end

  describe "when there are html tags" do
    let(:text) { '<a href="foo.com">go</a>' }

    it "when there are html tags" do
      tokenizer.all.must_equal ['go']
    end
  end

  describe 'when there are html entities' do
    describe 'that are word based' do
      let(:text) { '&nbsp; hello' }

      it "does not include the entity" do
        tokenizer.all.must_equal ['hello']
      end
    end

    describe 'that are number based' do
      let(:text) {'a&#768; pleasant hello' }

      it "does not include the entity" do
        tokenizer.all.must_equal ['a', 'pleasant', 'hello']
      end
    end
  end

  describe 'when there are apostrophes' do
    let(:text) { "I don't know" }

    it "does not break the word apart" do
      tokenizer.all.must_equal ['I', "don't", 'know']
    end
  end

  describe 'when there are hyphens' do
    let(:text) { "user-facing issues" }

    it "does not break the word apart" do
      tokenizer.all.must_equal ['user-facing', 'issues']
    end
  end
end
