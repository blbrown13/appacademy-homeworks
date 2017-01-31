class Board

  CUPS = {
    :four_stone_cup => [:stone, :stone, :stone, :stone],
  }

  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with
    # four stones each
    cups.each_with_index do |cup, idx|
      if idx != 6 && idx != 13
        cup << CUPS[:four_stone_cup]
        cup.flatten!
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0,13)
    raise "Invalid starting cup" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    # empties the selected cup
    # distributes the stones from the selected cup
    # places stones in the current player's cup
    # doesn't place stones in the opponent's cup
    # calls #render at the end of each turn
    # calls helper method #next_turn

    stones = cups[start_pos]
    cups[start_pos] = []

    cup = start_pos
    until stones.empty?
      cup += 1
      cup = 0 if cup > 13

      if cup == 6
        cups[6] << stones.pop if current_player_name == @name1
      elsif cup == 13
        cups[13] << stones.pop if current_player_name == @name2
      else
        cups[cup] << stones.pop
      end
    end

    render
    next_turn(cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].count == 1
    ending_cup_idx
  end

  def render
    sleep(0.75)
    system('clear')
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    # returns true if one side of non-point cups is empty
    # returns false if neither side of non-point cups is empty
    return true if cups[0..5].all? {|cup| cup.empty? }
    return true if cups[7..12].all? {|cup| cup.empty? }
    false
  end

  def winner
    # returns :draw if the game was tied
    # returns the winner's name if the game was won
    player1_score = cups[6].count
    player2_score = cups[13].count

    return :draw if player1_score == player2_score
    player1_score > player2_score ? @name1 : @name2
  end
end
