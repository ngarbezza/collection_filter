# frozen_string_literal: true

module CollectionFilter
  class Open < Base
    def self.can_filter?(object, block)
      block.call(object)
    end

    def add(object, collection)
      collection << object
    end
  end
end
