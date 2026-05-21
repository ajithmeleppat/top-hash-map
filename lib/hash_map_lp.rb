# HashMap implementation using linear probing
require_relative 'hash_map'

class HashMapLp < HashMap
  def initialize
    super
  end

  def set(key, value)
    if self.has?(key)
      @bucket[get_index(key)][:value] = value
    else
      hash_code = hash(key)
      until @bucket[hash_code].nil?
        hash_code +=1
      end
      @bucket[hash_code] = {key: key, value: value}
    end
    if self.length > @capacity * @load_factor
        @capacity *= 2
        puts "capacity increased to #{@capacity}"
    end
  end 
end