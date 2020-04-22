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
      filter_for(object).add(object, @collection)
      self
    end

    private

    def filter_for(object)
      filters_provider.find_filter(object, @condition)
    end

    def filters_provider
      Base
    end

    def method_missing(selector, *args, &block)
      @collection.send(selector, *args, &block)
    end

    def respond_to_missing?(selector, include_private = false)
      @collection.send(:respond_to_missing?, selector, include_private) || super
    end
  end
end
