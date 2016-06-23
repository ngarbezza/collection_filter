require_relative 'test_helper'

class UndefinedCollectionFilterTest < Minitest::Test
  def test_it_does_not_add_an_element_that_should_be_filtered
    array = array_filtering_even_numbers

    array << 3

    assert array.empty?
  end

  def test_it_adds_an_element_that_should_not_be_filtered
    array = array_filtering_even_numbers

    array << 12

    assert array.size == 1
    assert array.include?(12)
  end

  def array_filtering_even_numbers
    condition = ->(element) { element.even? }
    Array.filter_with(condition)
  end
end
