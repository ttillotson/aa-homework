class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    fill_cups
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Invalid starting cup" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        @cups[6] << stones.pop if current_player_name == name1
      elsif cup_idx == 13
        @cups[13] << stones.pop if current_player_name == name2
      else
        @cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].length == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
      return true
    else
      false
    end
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count
    return :draw if player1_count == player2_count 
    player1_count > player2_count ? name1 : name2
  end

  private

  def fill_cups
    4.times do |idx|
      (0..13).each do |i|
        next if i == 6
        next if i == 13
        @cups[i] << :stone
      end
    end
  end
end


class InvalidStartingCup < StandardError
  def message
    "That's not a valid starting move."
  end
end
