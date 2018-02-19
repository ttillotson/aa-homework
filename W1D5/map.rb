require 'byebug'

class Map
  attr_reader :a_map

  def initialize
    @a_map = []
  end

  def assign(key, value)
    if a_map.includes?(key)
      a_map.map do |pair|
        if pair[0] == key
          pair[1] = value
        end
      end
    else
      a_map << [key, value]
    end
    a_map
  end

  def lookup(key)
    match = a_map.select{|pair| pair[0] == key}
    return nil if match.empty?
    match[0]
  end

  def remove(key)
    a_map.each do |pair|
      a_map.delete(pair) if pair[0] == key
    end
  end

  def show
    a_map
  end

end

class Array
  def includes?(key)
    self.any?{|pair| pair[0] == key}
  end
end
