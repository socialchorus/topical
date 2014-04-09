require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

describe Topical::Registrar do
  let(:registrar) { Topical::Registrar.new }

  describe "#get" do
    it "returns the registered class" do
      registrar.cache = {
        strip_html_tags: Topical::Processor::Text::StripHtmlTags
      }

      registrar.get(:strip_html_tags).must_equal Topical::Processor::Text::StripHtmlTags
    end

    it "raises an error when not registered yet" do
      proc {
        registrar.get(:foo)
      }.must_raise Topical::ProcessorNotRegistered
    end
  end

  describe '#add' do
    describe 'when the key does not yet exist' do
      it "makes the class available via #get" do
        registrar.add(:strip_html_entities, Topical::Processor::Text::StripHtmlEntities)
        registrar.get(:strip_html_entities).must_equal Topical::Processor::Text::StripHtmlEntities
      end
    end

    describe 'when the key already exists' do
      it "replaces the key with the new value" do
        registrar.add(:strip_html_entities, Topical::Processor::Text::Trim)
        registrar.get(:strip_html_entities).must_equal(Topical::Processor::Text::Trim)
      end
    end
  end
end
