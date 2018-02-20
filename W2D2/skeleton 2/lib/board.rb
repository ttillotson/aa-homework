class Board
  attr_accessor :cups, :player1, :player2, :current_player, :players

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14){Array.new}
    fill_cups
    @players = [player1, player2]
    @current_player = players.first
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    raise ValidStartError unless @current_player.cups.include?(start_pos)
    true
  end

  def make_move(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx)
    if current_player.cups.include?(ending_cup_idx)
      make_move()
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
  end

  def winner
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


class ValidStartError < StandardError
  def message
    "That's not a valid starting move."
  end
end
