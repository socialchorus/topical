require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor do
  let(:processor_class) {
    class LeeterLite < Topical::Processor
      def transform
        text.gsub(/[aeio]/, leet_vowel($1))
      end

      def leet_vowel(vowel)
        {
          'a' => '@',
          'e' => '3',
          'i' => '1',
          'o' => '0'
        }
      end
    end

    LeeterLite
  }

  describe 'when initialized' do
    let(:processor) { processor_class.new(text) }

    describe 'with text' do
      let(:text) { 'Hello World' }

      it "will transform" do
        processor.process.must_equal 'H3ll0 W0rld'
      end
    end

    describe 'when text is not text' do
      let(:text) { nil }

      it "raise an error about the text needing to be text" do
        proc {
          processor.process
        }.must_raise Topical::TextNotText
      end
    end
  end

  describe 'when not initialized with text' do
    let(:processor) { processor_class.new }

    let(:text) { 'Hello World' }

    it "will transform as long as text is set before processing" do
      processor.text = text
      processor.process.must_equal 'H3ll0 W0rld'
    end

    it "#process takes an argument and will work with it" do
      processor.process(text).must_equal 'H3ll0 W0rld'
    end
  end
end
