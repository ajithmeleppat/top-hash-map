require_relative 'lib/linked_list'
require_relative 'lib/hash_map_chained'
require_relative 'lib/hash_map_lp'
require_relative 'lib/hash_map_qp'

test = HashMapChained.new
# test = HashMapLp.new
# test = HashMapQp.new

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
puts test
puts test.length

test.set('monkey', 'brown')
test.set('night', 'dark')
test.set('orange', 'orange')
test.set('penguin', 'black and white')
test.set('queen', 'royal')
test.set('rose', 'red')
test.set('sun', 'yellow')
test.set('tomato', 'red')
test.set('umbrella', 'blue')
test.set('violet', 'purple')
test.set('watermelon', 'green')
test.set('xylophone', 'rainbow')
puts test
puts test.length

test.set('laptop', 'silver')
test.set('phone', 'black')
test.set('mouse', 'ergonomic')
test.set('keyboard', 'mechanical')
test.set('monitor', 'widescreen')
puts test
puts test.length

test.set('router', 'wireless')
# test.set('camera', 'digital')
# test.set('headphones', 'wireless')


puts test
puts test.length

