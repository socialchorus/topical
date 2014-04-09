# Topical

Topical is natural language processing in the super-lite realm. Its main
aim is to extract keywords or topics from text. It comes with an easy
and a build your own lego adventure mode. See below for details

## Installation

Add this line to your application's Gemfile:

    gem 'topical'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install topical

## Usage

### Basic Usage

    words = Topical.filter(text)
    # => <#Topical::WordList words=["foo", "bar" ...]>

    words.group_by_stem
    # ... some grouped hash

    words.group_by_similar
    # 

### Customizing Usage

    class MyCustomTextProcessor < Topical::Processor
      def transform
        text + ' customized!'
      end
    end

    Topical.register(:custom, MyCustomTextProcessor)

    class Tokenizer < Topical::Tokenizer
      def preprocessors
        [:trim, :custom]
      end
    end

    words = Tokenizer.new(text).words
    words.class
    # => <#Topical::WordList words=["foo", "bar" ...]>   
 
    Topical.stopwords.add(my_collection_of_words)
    
    Topical::Keywordize.new(words).filter
    # => <#Topical::WordList words=["foo", "bar" ...]>
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
