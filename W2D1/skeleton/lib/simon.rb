class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
      system ("clear")
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    @sequence_length += 1
    require_sequence
    round_success_message unless game_over

  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "What was the sequence of the colors"
    seq.length.times do |i|
      input = gets.chomp
      game_over = true unless input == seq[i]
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You got it!"
  end

  def game_over_message
    puts "That's not the color!"
    puts "The sequence was #{seq.join(", ")}"
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end
