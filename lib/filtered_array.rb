class FilteredArray < Array
  def self.filter_with(condition)
    new(condition)
  end

  def initialize(condition)
    @condition = condition
  end

  def <<(an_object)
    if @condition.call(an_object)
      super
    end
  end
end
