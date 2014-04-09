require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'

describe Topical do
  before do
    Topical.registrar.cache.delete(:foo)
  end

  describe '#register' do
    it "adds to the stored registrar" do
      Topical.register(:foo, Topical::Processor::Trim)
      Topical.registrar.get(:foo).must_equal Topical::Processor::Trim
    end
  end

  describe '#processor' do
    it "gets from the stored registrar" do
      Topical.registrar.add(:foo, Topical::Processor::Trim)
      Topical.processor(:foo).must_equal Topical::Processor::Trim
    end
  end
end
