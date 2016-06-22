require_relative 'test_helper'

require 'collection_filter/undefined'

class UndefinedCollectionFilterTest < Minitest::Test
  def test_it_does_not_add_an_element_that_should_be_filtered
    condition = ->(element) { element.even? }
    array = CollectionFilter::Undefined.new(Array.new, condition)

    array << 3

    assert array.empty?
  end

  def test_it_adds_an_element_that_should_not_be_filtered
    condition = ->(element) { element.even? }
    array = CollectionFilter::Undefined.new(Array.new, condition)

    array << 12

    assert array.size == 1
    assert array.include?(12)
  end
end
