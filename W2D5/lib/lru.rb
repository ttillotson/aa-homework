class LRUCache
  attr_reader :max_length

  def initialize(max_length)
    @cache = []
    @max_length = max_length
  end

  def count
    cache.length
  end

  def add(el)
    cache.delete(el)
    cache.push(el)
    cache.shift if cache.length > max_length
    show
  end

  def show
    cache
  end

  def inspect
    show
  end

  private
  attr_accessor :cache

end
