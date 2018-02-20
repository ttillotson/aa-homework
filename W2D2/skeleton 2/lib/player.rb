class Player
  attr_reader :name, :side, :cups

  def initialize(name, side)
    @name = name
    @side = side
    @cups = (0...6).to_a if side == 1
    @cups = (7...13).to_a if side == 2
  end

  def prompt
    puts "#{@name}, please enter which cup you would like to start from: "
    start_pos = gets.chomp.to_i
    if (start_pos.between?(1,6) && @side != 1 ||
        start_pos.between?(7,12) && @side != 2)
      raise "Not your side!"
    else
      start_pos
    end
  end
end
