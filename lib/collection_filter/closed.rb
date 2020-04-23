# frozen_string_literal: true

module CollectionFilter
  class Closed < Base
    def self.can_filter?(object, condition)
      !condition.call(object)
    end

    def add_first(object, condition)
      # nothing to do
    end

    def add_last(object, collection)
      # nothing to do
    end
  end
end
