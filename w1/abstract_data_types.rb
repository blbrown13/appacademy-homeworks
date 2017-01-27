### Exercise 1 - Stack (LIFO)

class Stack

  attr_reader :stack

  def initialize
    @stack = Array.new
  end

  def add(el)
    stack << el
  end

  def remove
    stack.pop
  end

  def show
    stack
  end
end

# stack = Stack.new
# p stack.show
# stack.add(3)
# p stack.show
# stack.add(9)
# p stack.show
# stack.remove
# p stack.show
# stack.remove
# stack.remove
# p stack.show

### Exercise 2 - Queue (FIFO)

class Queue

  attr_reader :queue

  def initialize
    @queue = Array.new
  end

  def enqueue(el)
    queue.unshift(el)
  end

  def dequeue
    queue.pop
  end

  def show
    queue
  end
end

# queue = Queue.new
# p queue.show
# queue.enqueue(9)
# p queue.show
# queue.enqueue(13)
# p queue.show
# queue.enqueue(87)
# p queue.show
# p queue.dequeue
# p queue.show


### Exercise 3 - Map

class Map

  attr_reader :map

  def initialize
    @map = Array.new { [] }
  end

  def assign(key, value)
    if lookup(key)
      map.each_with_index do |pair, idx|
        map[idx] = [key, value] if pair.include?(key)
      end
    else
      map << [key, value]
    end
  end

  def lookup(key)
    map.each do |pair|
      return true if pair.first == key
    end
    false
  end

  def remove(key)
    map.reject! { |pair| pair.first == key }
  end

  def show
    map
  end
end

m = Map.new
m.assign(1, 2)
m.assign(4, 2)
p m.show
m.assign(1, 3)
p m.show
m.assign(2, 5)
p m.show
m.remove(4)
p m.show
