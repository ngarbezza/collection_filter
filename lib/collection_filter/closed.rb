# frozen_string_literal: true

module CollectionFilter
  class Closed < Base
    def self.can_filter?(object, block)
      !block.call(object)
    end

    def add(object, collection)
      # nothing to do
    end
  end
end
