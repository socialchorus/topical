require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor::Array::JoinPhrases do
  let(:processor) { Topical::Processor::Array::JoinPhrases.new }

  let(:result) { processor.process(words) }

  describe 'when there are only two occurences of the phrase' do
    let(:words) { "exclusive online deal offered only as an online deal".split(' ')  }

    it "replaces the first occurrence of the phrase" do
      result[1].must_equal 'online deal'
    end

    it "replaces subsequent occurences fo the phrase" do
      result.select{|word| word == 'online deal' }.size.must_equal 2
    end
  end

  describe 'when words in the phrase repeat out of order' do
    let(:words) { "go online for an exclusive online deal offered only as online deal today".split(' ') }

    it "does not replace when the word is not followed by the rest of phrase" do
      result[1].must_equal 'online'
    end

    it "joins the phrases" do
      result.select{|word| word == 'online deal' }.size.must_equal 2
    end
  end

  describe 'when there are more than that many occurences of the phrase' do
    let(:words) { 'online deal is an online deal so go get your online deal'.split(' ') }

    it "joins all occurences" do
      result.select{|word| word == 'online deal' }.size.must_equal 3
    end
  end

  describe 'when the phrases are more that two words' do
    let(:words) { 'just do it said nike to the advocate just do it'.split(' ') }

    it "joins these larger phrases" do
      result.select{|word| word == 'just do it'}.size.must_equal 2
    end
  end
end
