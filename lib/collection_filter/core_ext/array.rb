class Array
  def self.filter_with(block)
    CollectionFilter::Undefined.filter_with(new, block)
  end
end
