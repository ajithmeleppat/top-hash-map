# HashMap implementation using chaining
class HashMapChained
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @bucket = Array.new(16)
  end

  def initialize_bucket
    @capacity.times do |i| 
      @bucket[i] = nil
    end
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }  
    hash_code % @capacity
  end

  def set(key, value)
    hash_code = hash(key)
    if self.has?(key)
      @bucket[hash_code].overwrite(key, value)
    else
      @bucket[hash_code] = LinkedList.new() if @bucket[hash_code].nil?  
      @bucket[hash_code].append(key, value)  
    end
    if self.length > @load_factor * @capacity
      @capacity *= 2 
      puts "capacity increased"
    end
  end 

  def get(key)
    list = @bucket[hash(key)]
    return nil if list.nil?
    return list.value_for_key(key)
  end

  def has?(key)
    list = @bucket[hash(key)]
    return false if list.nil?
    return list.contains?(key)
  end

  def remove(key)
    list = @bucket[hash(key)]
    return nil if list.nil?
    index = list.index(key)
    removed = list.remove_at(index)
    removed
  end

  def length
    @bucket.compact.length
  end

  def clear
    initialize_bucket
  end

  def keys
    array = []
    @bucket.compact.map do |list|
      list.keys.each {|key| array << key}  
    end
    array
  end

  def values
    array = []
    @bucket.compact.map do |item|
      item.values.each {|value| array << value}
    end
    array
  end

  def entries
    entries = @bucket.compact.map do |item| 
      item.to_s
    end
    entries.to_s
  end

  def to_s
    entries = @bucket.map do |item| 
      item
    end
    entries.to_s
  end
end