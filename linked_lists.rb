# Class defining an implementation of a linked list
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    if @head.nil?
      @head = @tail = Node.new(value)
      @head.next_node = @tail
    else
      @tail = @tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @head.nil?
      @head = @tail = Node.new(value)
      @head.next_node = @tail
    else
      previous = @head
      @head = Node.new(value)
      @head.next_node = previous
    end
  end

  def size
    count = 0
    tmp = @head
    return count if @head.nil?

    return count + 1 if @head == @tail

    until tmp.nil?
      count += 1
      tmp = tmp.next_node
    end
    count
  end

  def at(index)
    count = 0
    tmp = @head
    return nil if index > size
    until tmp.nil?
      count += 1
      tmp = tmp.next_node
      return tmp.value if count == index

    end
  end

  def pop
    count = 0
    tmp = @head
    return 'Cannot delete as there are no items' if @head.nil?

    if size == 1
      @head = nil
      @tail = nil
      return
    end
    size_2_pop
    pop_helper(tmp, count)
  end

  def pop_helper(tmp, count)
    until tmp.nil?
      count += 1
      tmp = tmp.next_node
      if count == size - 2
        tmp.next_node = nil
        @tail = tmp
      end
    end
  end

  def size_2_pop
    return unless @head.next_node.next_node.nil?
    @head.next_node = nil
    @tail = @head
  end

  def contains?(value)
    tmp = @head
    until tmp.nil?
      return true if tmp.value == value

      tmp = tmp.next_node
    end
    false
  end

  def find(value)
    count = 0
    tmp = @head
    until tmp.nil?
      return count if tmp.value == value

      count += 1
      tmp = tmp.next_node
    end
  end

  def to_s
    string = ''
    count = 0
    tmp = @head
    until tmp.nil?
      string.concat("( #{tmp.value} ) -> ")
      count += 1
      tmp = tmp.next_node
    end
    string.concat('nil')
    puts string
  end
end

# Class defining a node for use with linked lists
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new

list.append(3)
# list.append(4)
# list.append(5)

# list.prepend(2)
# list.prepend(1)

puts "The value of the node at Head is: #{list.head}"

puts "The value of the node at Tail is: #{list.tail}"

puts "The size of the list is: #{list.size}"

puts "The value of the node at index 3 is: #{list.at(3)}"

list.pop

puts "The size of the list is now: #{list.size}"

p list.contains?(5)

p list.find(4)

list.to_s
