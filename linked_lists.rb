# frozen_string_literal: true

require_relative 'node'

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
    pointer = @head
    return count if @head.nil?

    return count + 1 if @head == @tail

    until pointer.nil?
      count += 1
      pointer = pointer.next_node
    end
    count
  end

  def at(index)
    count = 0
    pointer = @head
    return 'nil' if index > size - 1

    until pointer.nil?
      return pointer.value if count == index

      count += 1
      pointer = pointer.next_node
    end
  end

  def pop
    return puts 'Cannot delete as there are no items in the list' if @head.nil?

    if size == 1
      @head = nil
      @tail = nil
      return
    end
    pointer = @head
    pointer = pointer.next_node until pointer.next_node == @tail
    pointer.next_node = nil
    @tail = pointer
  end

  def contains?(value)
    pointer = @head
    until pointer.nil?
      return true if pointer.value == value

      pointer = pointer.next_node
    end
    false
  end

  def find(value)
    count = 0
    pointer = @head
    until pointer.nil?
      return count if pointer.value == value

      count += 1
      pointer = pointer.next_node
    end
  end

  def to_s
    string = ''
    count = 0
    pointer = @head
    until pointer.nil?
      string << "( #{pointer.value} ) -> "
      count += 1
      pointer = pointer.next_node
    end
    string << 'nil'
    puts string
  end

  def insert_at(value, index)
    count = 0
    pointer = @head
    return puts 'Cannot insert at this index as the list is too short' if index > size

    until count == index - 1
      count += 1
      pointer = pointer.next_node
    end
    new_node = Node.new(value)
    @tail = new_node if size == index
    new_node.next_node = pointer.next_node
    pointer.next_node = new_node
  end

  def remove_at(index)
    count = 0
    pointer = @head
    return puts 'Cannot remove, index does not exist' if index > size - 1

    until count == index - 1
      count += 1
      pointer = pointer.next_node
    end
    @tail = pointer if pointer.next_node == @tail
    pointer.next_node = pointer.next_node.next_node
  end
end
