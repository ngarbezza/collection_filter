# frozen_string_literal: true

module CollectionFilter
  class Open < Base
    def self.can_filter?(object, condition)
      condition.call(object)
    end

    def add_first(object, collection)
      collection.unshift(object)
    end

    def add_last(object, collection)
      collection << object
    end
  end
end
