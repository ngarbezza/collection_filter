require 'test_helper'

class FilteredArray < Array
  def self.filter_with(condition)
    new(condition)
  end

  def initialize(condition)
    @condition = condition
  end

  def <<(element)
    if @condition.call(element)
      super
    end
  end
end

class CollectionFilterTest < Minitest::Test

  def test_it_does_not_add_an_element_that_should_be_filtered
    condition = ->(element) { element.even? }
    array = FilteredArray.filter_with(condition)

    array << 3

    assert array.empty?
  end
end
