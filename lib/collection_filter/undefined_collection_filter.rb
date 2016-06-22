class UndefinedCollectionFilter
  instance_methods.each do |m|
    undef_method(m) unless m =~ /(^__|^nil\?$|^send$|^object_id$)/
  end

  def initialize(collection, condition)
    @collection = collection
    @condition = condition
  end

  def <<(an_object)
    if @condition.call(an_object)
      super
    end
  end

  def respond_to?(selector, include_private=false)
    @collection.respond_to?(selector, include_private)
  end

  private

  def method_missing(selector, *args, &block)
    @collection.send(selector, *args, &block)
  end
end
