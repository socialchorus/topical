require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Stopwords do
  let(:stopwords) { Topical::Stopwords.new }
  let(:words_path) { File.dirname(__FILE__) + '/../lib/topical/stopwords/en.csv' }
  let(:words_string) { Topical::Processor::Trim.new(File.read(words_path)).process }

  describe 'when loading an :symbol' do
    it "loads from a local file" do
      stopwords.load(:en)
      stopwords.words.join(',').must_equal words_string
    end
  end

  describe 'when loading a file path' do
    it "reads and splits it" do
      stopwords.load(words_path)
      stopwords.words.join(',').must_equal words_string
    end
  end

  describe 'when tags are duplicated' do
    it "uniquifies them" do
      stopwords.load(:en)
      stopwords.load(words_path)
      stopwords.words.must_equal words_string.split(',')
    end
  end

  describe 'when the file contents are oddly spaced between commas' do
    let(:wonky_path) { File.dirname(__FILE__) + "/support/wonky.csv" }

    it "strips them" do
      stopwords.load(wonky_path)
      stopwords.words.must_equal ['foo', 'whatever']
    end
  end
end
