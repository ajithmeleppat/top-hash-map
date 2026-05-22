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
      hash = hash(key)
      until @bucket[hash].nil?
        hash +=1
      end
      @bucket[hash] = {key: key, value: value}
    end
    if self.length > @threshold
       resize_redistribute
    end
  end 
end