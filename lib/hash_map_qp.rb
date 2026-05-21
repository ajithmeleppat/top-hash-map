# HashMap implementation using quadratic probing
require_relative 'hash_map'

class HashMapQp < HashMap
  def initialize
    super
  end

  def set(key, value)
    if self.has?(key)
      @bucket[get_index(key)][:value] = value
    else
      hash_code = new_hash =  hash(key)
      qp_index = 0
      until @bucket[new_hash].nil?
        qp_index += 1
        new_hash = hash_code + qp_index ** 2
      end
      @bucket[new_hash] = {key: key, value: value}
    end
    if self.length > @capacity * @load_factor
        @capacity *= 2
        puts "capacity increased to #{@capacity}"
    end
  end 
end