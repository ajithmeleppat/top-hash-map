# HashMap implementation using chaining
require_relative 'hash_map'

class HashMapChained < HashMap
  def initialize
    super
  end

  def set(key, value)
    hash_code = hash(key)
    if self.has?(key)
      @bucket[hash_code].overwrite(key, value)
    else
      @bucket[hash_code] = LinkedList.new() if @bucket[hash_code].nil?  
      @bucket[hash_code].append(key, value)  
    end
    if self.length > @threshold
      puts key
      resize_redistribute
    end
  end 

  def get(key)
    return nil if @bucket[hash(key)].nil?
    return @bucket[hash(key)].value_for_key(key)
  end

  def has?(key)
    return false if @bucket[hash(key)].nil?
    return @bucket[hash(key)].contains?(key)
  end

  def remove(key)
    return nil if @bucket[hash(key)].nil?
    index = @bucket[hash(key)].index(key)
    removed = @bucket[hash(key)].remove_at(index)
    removed
  end

  def length
    @bucket.compact.length
  end

  def keys
    @bucket.compact.map { |list| list.keys.each { |key| key } }.to_s
  end

  def values
    @bucket.compact.map { |item| item.values.each { |value| value } }.to_s
  end

  def entries
    @bucket.compact.map { |item| item.to_s }.to_s
  end

  def resize_redistribute
    old = @bucket.compact
    resize
    old.compact.each do |list|
      kv_pairs = list.to_array
      kv_pairs.each { |item| set(item[:key],item[:value])}
    end
  end
end