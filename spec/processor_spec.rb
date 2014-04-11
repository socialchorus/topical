require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Processor do
  let(:processor_class) {
    class LeeterLite < Topical::Processor
      def transform
        input.gsub(/[aeio]/, leet_vowel($1))
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
    let(:processor) { processor_class.new(input) }

    describe 'with input' do
      let(:input) { 'Hello World' }

      it "will transform" do
        processor.process.must_equal 'H3ll0 W0rld'
      end
    end
  end

  describe 'when not initialized with input' do
    let(:processor) { processor_class.new }

    let(:input) { 'Hello World' }

    it "will transform as long as input is set before processing" do
      processor.input = input
      processor.process.must_equal 'H3ll0 W0rld'
    end

    it "#process takes an argument and will work with it" do
      processor.process(input).must_equal 'H3ll0 W0rld'
    end
  end
end
