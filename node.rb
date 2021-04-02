# frozen_string_literal: true

# Class defining a node for use with linked lists
class Node
  attr_accessor :next_node
  attr_reader :value

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
