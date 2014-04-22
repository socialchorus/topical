require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Engine do
  let(:engine) { Topical::Engine.new(instructions, input) }

  let(:input) { 'The <a href="/foo">  Quick</a> brown fox jumped' }

  let(:instructions) {
    [
      :strip_html_tags,
      :split_words,
      :downcase,
      :remove_stopwords
    ]
  }

  describe 'normal initialization' do
    it 'runs the instructions against the input' do
      engine.run.must_equal ["quick", "brown", "fox", "jumped"]
    end
  end

  describe 'initialization without input' do
    let(:engine) { Topical::Engine.new(instructions) }

    it 'runs the instructions against the input' do
      engine.run(input).must_equal ["quick", "brown", "fox", "jumped"]
    end
  end

  describe 'subtraction' do
    describe 'when an array of words' do
      it "should process and remove those words" do
        words = engine - ['brown', 'rabbit']
        words.must_equal ['quick', 'fox', 'jumped']
      end
    end

    describe 'when another engine' do
      let(:capped_engine) { 
        Topical::Engine.new([
          :strip_html_tags,
          :split_words,
          :remove_lowercase,
          :downcase
        ], input)
      }

      it "should process both engines and subtract the results" do
       words = engine - capped_engine
       words.must_equal ['brown', 'fox', 'jumped']
      end
    end
  end

  describe 'addition' do
    describe 'when an array of words' do
      it "adds the processed words to the array of words" do
        words = engine + ['and', 'rabbits']
        words.must_equal ['quick', 'brown', 'fox', 'jumped', 'and', 'rabbits']
      end
    end

    describe 'when with another engine' do
      let(:capped_engine) {
        Topical::Engine.new([:strip_html_tags, :split_words, :remove_lowercase], input)
      }

      it "adds the two processed collections together" do
        words = engine + capped_engine
        words.must_equal ['quick', 'brown', 'fox', 'jumped', 'The', 'Quick']
      end
    end
  end
end
