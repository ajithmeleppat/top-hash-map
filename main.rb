require_relative 'lib/linked_list'
require_relative 'lib/hash_map_chained'

test = test = HashMapChained.new
puts test.entries
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# puts test.entries
# puts test.length
test.set('kite','blue')
# puts test.entries
test.set('moon', 'silver')
test.set('chair','black')
test.set('table', 'black')
puts test.entries
puts test.length
puts "-----"
