require_relative 'test_helper'

require 'filtered_array'

class FilteredArrayTest < Minitest::Test
  def test_it_does_not_add_an_element_that_should_be_filtered
    condition = ->(element) { element.even? }
    array = FilteredArray.filter_with(condition)

    array << 3

    assert array.empty?
  end

  def test_it_adds_an_element_that_should_not_be_filtered
    condition = ->(element) { element.even? }
    array = FilteredArray.filter_with(condition)

    array << 12

    assert array.size == 1
    assert array.include?(12)
  end
end
