# frozen_string_literal: true

require 'error_handling_protocol'

module CollectionFilter
  class Base
    def self.find_filter(object, block)
      filter_implementation_for(object, block).new
    end

    def self.filter_implementation_for(object, block)
      filter_implementations.detect { |each| each.can_filter?(object, block) }
    end

    def self.filter_implementations
      [CollectionFilter::Open, CollectionFilter::Closed]
    end

    def self.can_filter?(_object, _block)
      subclass_responsibility
    end
  end
end
