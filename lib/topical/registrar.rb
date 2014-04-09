module Topical
  class Registrar
    attr_accessor :cache

    def initialize
      @cache ||= {}
    end

    def get(key)
      raise ProcessorNotRegistered unless cache[key]
      cache[key]
    end

    def add(key, klass)
      cache[key] = klass
    end
  end
end
