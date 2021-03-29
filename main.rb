require_relative 'linked_lists'

list = LinkedList.new

list.append(3)
list.append(4)
list.append(5)

list.prepend(2)
list.prepend(1)

puts "The value of the node at Head is: #{list.head.value}"

puts "The value of the node at Tail is: #{list.tail.value}"

puts "The size of the list is: #{list.size}"

puts "The value of the node at index 3 is: #{list.at(3)}"

puts 'Popping node off'
list.pop

puts "The size of the list is now: #{list.size}"

puts "It is #{list.contains?(5)} that the list contains 5"

puts "The index of the node with value 4 is: #{list.find(4)}"

list.to_s

puts 'Inserting node'
list.insert_at(5, 4)

list.to_s

puts 'Removing node at index 4'
list.remove_at(4)

list.to_s
