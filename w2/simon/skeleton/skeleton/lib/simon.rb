class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    # The goal of require_sequence is to prompt the user to repeat
    # back the new sequence that was just shown to them, one color
    # at a time. If they give an incorrect color, it should
    # immediately set @game_over to be false
    @seq.each do |color|
      puts "Guess the sequence! Example: r for red"
      guess = gets.chomp
      if guess != color.first
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS[rand(COLORS.length)]
  end

  def round_success_message
    "Good job! Let's keep playing..."
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
