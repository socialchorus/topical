require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Splitter::Word do
  let(:processor) { Topical::Splitter::Word.new(text) }

  describe 'when there is an apostrophe' do
    let(:text) { "They're here!" }

    it "keeps the word together" do
      processor.process.first.must_equal "They're"
    end
  end

  describe 'when there is an hyphen' do
    let(:text) { "user-facing problems" }

    it "keeps the word together" do
      processor.process.first.must_equal "user-facing"
    end
  end

  describe 'when there is an hashtag' do
    let(:text) { "user-facing #problems" }

    it "keeps the word together" do
      processor.process[1].must_equal "#problems"
    end
  end

  describe 'when there is an @' do
    let(:text) { "user-facing Social@Ogilvy" }

    it "keeps the word together" do
      processor.process[1].must_equal "Social@Ogilvy"
    end
  end

  describe 'when there is an ampersand' do
    let(:text) { "user-facing AT&T" }

    it "keeps the word together" do
      processor.process[1].must_equal "AT&T"
    end
  end

  describe 'whitespace' do
    let(:text) { "  hello world " }

    it "strips it all" do
      processor.process.must_equal ['hello', 'world']
    end
  end
end