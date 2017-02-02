fisheys = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
          'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish
# lengths to all other fish lengths
def sluggish(fisheys)
  longest = ''

  fisheys.each_index do |i|
    fisheys.each_index do |j|
      longest = fisheys[i].length > fisheys[j].length ? fisheys[i] : fisheys[j]
    end
  end

  longest
end

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting
# algorithm that runs in O(n log n) in the Sorting Demo. Remember that
# Big O is classified by the dominant term.

# why is this not working?? doesn't return a sorted/merged
# array which finds the correct fish
class Array

  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y }
    return self if self.length <= 1

    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end
end

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to
# the longest fish that you have found so far while stepping
# through the array only once.

def clever(fisheys)
  largest = fisheys[0]
  fisheys.each_with_index do |fish, idx|
    largest = fisheys[idx] if fisheys[idx].length > largest.length
  end
  largest
end

###################################

# puts "~sluggish~"
# output = sluggish(fisheys)
# puts output
# puts output == "fiiiissshhhhhh"
# puts
#
# puts "~clever~"
# output = clever(fisheys)
# puts output
# puts output == "fiiiissshhhhhh"
# puts
#
# puts "~dominant~"
# output = fisheys.merge_sort
# puts output
# puts output == "fiiiissshhhhhh"
# puts

tiles_array = ["up", "right-up", "right", "right-down",
               "down", "left-down", "left",  "left-up" ]


# Slow Dance
#
# Given a tile direction, iterate through a tiles array to return
# the tentacle number (tile index) the octopus must move. This should
# take O(n) time.

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == dir
  end
end

# p slow_dance("up", tiles_array)
# > 0
# p slow_dance("right-down", tiles_array)
# > 3


# Constant Dance!
#
# Now that the octopus is warmed up, let's help her dance
# faster. Use a different data structure and write a new
# function so that you can access the tentacle number in O(1) time.


def constant_dance(dir, tiles_array)
  tiles_array.index(dir)
end

# p constant_dance("up", tiles_array)
# > 0
# p constant_dance("right-down", tiles_array)
# > 3

##################
# FROM SOLUTIONS #
##################

# constant octopus dance
#use a hash for constant lookup (instead of an array)
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction]
end

# fast_dance("up", new_tiles_data_structure)
# > 0
#
# fast_dance("right-down", new_tiles_data_structure)
# > 3
