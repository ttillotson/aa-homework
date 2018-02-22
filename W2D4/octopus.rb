
def sluggish_octopus(fishes)
  fishes.each_index do |idx1|
    biggest_fish = true
    fishes.each_index do |idx2|
      next if idx2 <= idx1
      biggest_fish = false if fishes[idx1] < fishes[idx2]
    end

    return fishes[idx1] if biggest_fishq
  end
end

class Array
  def merge_sort(&prc)
    return self if length == 1
    mid = length/2
    prc ||= Proc.new {|x, y| x <=> y}

    left_sorted = take(mid).merge_sort(&prc)
    right_sorted = drop(mid).merge_sort(&prc)

    Array.merge(left_sorted, right_sorted, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << right.shift
      when 1
        merged << right.shift
      end
    end
    merged.concat(left).concat(right)

    merged
  end
end

def dominant_octopus(fishes)
  big_fish_proc = Proc.new {|fish1, fish2| fish2.length <=> fish1.length}
  fishes.merge_sort(big_fish_proc).first
end

def clever_octopus(fishes)
  fishes.reduce do |fish_king, minnow|
    fish_king ||= minnow
    fish_king = minnow if fish_king.length < minnow.length
    fish_king
  end
end

def slow_dance(tile, tile_options)
  desired_tile_tentacle = nil
  tile_options.each_index  do |tentacle|
    desired_tile_tentacle = tentacle if tile_options[tentacle] == tile
  end

  desired_tile_tentacle
end

def constant_dance(tile, tile_options)
  tile_hash = {"up"=>0,
               "right-up"=>1,
               "right"=>2,
               "right-down"=>3,
               "down"=>4,
               "left-down"=>5,
               "left"=>6,
               "left-up"=>7}

  return tile_hash[tile]
end
