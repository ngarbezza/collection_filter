# frozen_string_literal: true

require 'collection_filter/undefined'

class Array
  def self.filter_with(block)
    CollectionFilter::Undefined.filter_with(new, block)
  end
end
