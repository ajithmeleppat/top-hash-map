# base class
class HashMap
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @bucket = Array.new(@capacity)
  end

  def clear
    @bucket.fill(nil)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }  
    hash_code % @capacity
  end

  def get_index(key)
    @bucket.each_with_index do |item, index|
      next if item.nil?
      return index if item[:key] == key
    end
    -1 
  end

  def get(key)
    return nil unless self.has?(key)
    @bucket[get_index(key)][:value]
  end

  def has?(key)
    @bucket.compact.each do |item|
      return true if item[:key] == key
    end
    false
  end

  def remove(key)
    return nil unless self.has?(key)
    removed = @bucket[get_index(key)][:value] 
    @bucket[get_index(key)] = nil
    removed
  end

  def length
    @bucket.compact.length
  end

  def keys
    @bucket.compact.map {|item| item[:key]}.to_s
  end

  def values
    @bucket.compact.map {|item| item[:value]}.to_s
  end

  def entries
    @bucket.compact.map { |item| "[#{item[:key]}, #{item[:value]}]" }.to_s
  end

  def to_s
    self.entries
  end

end