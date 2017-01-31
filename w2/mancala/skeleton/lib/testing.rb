stones = cups[start_pos]
cups.delete(cups[start_pos])
cup_idx = start_pos

until stones.empty?
  cup_idx += 1
  cup_idx = 0 if cup_idx > 13

  if cup_idx == 6
    @cups[6] << stones.pop if current_player_name == @name1
  elsif cup_idx == 13
    @cups[13] << stones.pop if current_player_name == @name2
  else
    @cups[cup_idx] << stones.pop
  end
end

render
next_turn(cup_idx)
