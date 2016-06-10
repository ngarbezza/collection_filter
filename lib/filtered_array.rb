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
