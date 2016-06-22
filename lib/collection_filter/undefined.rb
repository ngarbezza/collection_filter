module CollectionFilter
  class Undefined
    instance_methods.each do |m|
      undef_method(m) unless m =~ /(^__|^nil\?$|^send$|^object_id$)/
    end

    def self.filter_with(collection, block)
      new(collection, block)
    end

    def initialize(collection, block)
      @collection = collection
      @condition = block
    end

    def <<(object)
      filter_for(object).add(object, @collection)
    end

    def respond_to?(selector, include_private=false)
      @collection.respond_to?(selector, include_private)
    end

    private

    def filter_for(object)
      filters_provider.find_filter(object, @condition)
    end

    def filters_provider
      CollectionFilter::Base
    end

    def method_missing(selector, *args, &block)
      @collection.send(selector, *args, &block)
    end
  end
end
