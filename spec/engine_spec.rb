require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Engine do
  let(:engine) { Topical::Engine.new(instructions, input) }
  let(:input) { 'The <a href="/foo">  quick</a> brown fox jumped' }
  let(:instructions) {
    [
      :strip_html_tags,
      :split_words,
      :downcase,
      :remove_stopwords
    ]
  }

  it 'runs the instructions against the input' do
    engine.run.must_equal ["quick", "brown", "fox", "jumped"]
  end
end
