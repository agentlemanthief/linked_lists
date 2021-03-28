  class LinkedList
    attr_reader :head, :tail, :size
    def initialize
      @head = nil
      @tail = nil
    end

    def append(value)
      if @head == nil
        @head = @tail = Node.new(value)
        @head.next_node = @tail
      else
        @tail = @tail.next_node = Node.new(value)
      end
    end

    def prepend(value)
      if @head == nil
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
      return count if @head == nil
      return count + 1 if @head == @tail
      while tmp != nil
        count += 1
        tmp = tmp.next_node
      end
      count
    end

    def at(index)
      # Return node at index
      count = 0
      tmp = @head
      while tmp != nil
        count += 1
        return tmp.value if count == index
        tmp = tmp.next_node
      end
    end

    def pop
      count = 0
      tmp = @head
      return "Cannot delete as there are no items" if @head == nil
      if self.size == 1
        @head = nil
        @tail = nil
        return
      end
      if @head.next_node.next_node == nil
        @head.next_node = nil
        @tail = @head
      end
      while tmp != nil
        count += 1
        tmp = tmp.next_node
        if count == self.size - 2
          tmp.next_node = nil
          @tail = tmp
        end
      end
    end
  end

  class Node
    attr_accessor :value, :next_node
    def initialize(value = nil)
      @value = value
      @next_node = nil
    end
  end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)

# list.prepend(2)
# list.prepend(1)

puts "The value of the node at Head is: #{list.head}"

puts "The value of the node at Tail is: #{list.tail}"

puts "The size of the list is: #{list.size}"

puts "The value of the node at index 3 is: #{list.at(3)}"

p list.pop
p list.pop
p list.pop
p list.pop
p list.pop

p list.size

p list
