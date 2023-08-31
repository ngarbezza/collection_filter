# frozen_string_literal: true

module CollectionFilter
  class Undefined < BasicObject
    def self.filter_with(collection, block)
      new(collection, block)
    end

    def initialize(collection, block)
      @collection = collection
      @condition = block
    end

    def <<(object)
      add_last(object)
    end

    def push(object)
      add_last(object)
    end

    def unshift(object)
      add_first(object)
    end

    private

    def add_first(object)
      filter_for(object).add_first(object, @collection)
      self
    end

    def add_last(object)
      filter_for(object).add_last(object, @collection)
      self
    end

    def filter_for(object)
      filters_provider.find_filter(object, @condition)
    end

    def filters_provider
      Base
    end

    def method_missing(selector, ...)
      @collection.send(selector, ...)
    end

    def respond_to_missing?(selector, include_private = false)
      @collection.send(:respond_to_missing?, selector, include_private) || super
    end
  end
end
