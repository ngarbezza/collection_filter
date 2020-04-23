# frozen_string_literal: true

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

    assert_equal 1, array.size
    assert array.include?(12)
  end

  # this is to ensure respond_to_missing? is defined correctly
  # http://blog.marc-andre.ca/2010/11/15/methodmissing-politely/
  def test_methods_from_collection_class_can_be_accessed
    array = array_filtering_even_numbers

    assert_equal 0, array.method(:size).call
  end

  def test_the_result_of_addition_message_is_the_collection_in_any_case
    array = array_filtering_even_numbers

    assert_empty array << 3
    refute_empty array << 2
  end

  def test_push_message_is_under_filter
    array = array_filtering_even_numbers

    array.push(3)
    assert_empty array
    array.push(2)
    assert_equal 1, array.size
    assert array.include?(2)
  end

  def array_filtering_even_numbers
    filtering_condition = ->(element) { element.even? }
    Array.filter_with(filtering_condition)
  end
end
