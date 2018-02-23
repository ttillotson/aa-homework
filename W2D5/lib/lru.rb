class LRUCache
  attr_reader :max_length

  def initialize(max_length=4)
    @cache = []
    @max_length = max_length
  end

  def count
    cache.length
  end

  def add(el)
    cache.delete(el)
    cache.push(el)
    maintain_length
    show
  end

  def show
    cache.dup.freeze
  end

  def inspect
    show
  end

  private

  attr_accessor :cache

  def maintain_length
    cache.shift if cache.length > max_length
  end

end
