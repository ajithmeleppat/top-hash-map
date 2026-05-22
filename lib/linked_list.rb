class LinkedList
  def initialize
    @head = @tail = nil
  end

  def append(key, value)
    node = Node.new(key, value)
    if @tail
      @tail.next_node = node
      @tail = node
    else
      @head = @tail = node
    end
  end

  def prepend(key, value) 
    @head = Node.new(key, value, @head)
    @tail = @head unless @tail
  end

  def keys()
    node = @head
    array = []
    until node.nil?
      array << node.key
      node = node.next_node
    end
    array
  end

  def values()
    node = @head
    array = []
    until node.nil?
      array << node.value
      node = node.next_node
    end
    array
  end
  
  def overwrite(key, value)
    index = self.index(key)
    node = node_at(index)
    node.value = value
  end

  def to_s
    return nil if @head.nil? 
    return_string = "[#{@head.key}, #{@head.value}]"
    node = @head.next_node
    until node.nil?
      return_string << " -> [#{node.key}, #{node.value}]"
      node = node.next_node 
    end
    return_string
  end 

  def size
    node = @head
    size = 0
    until node.nil?
      size += 1
      node = node.next_node
    end
    return size
  end

  def head
    "[#{@head&.key}, #{@head&.value}]"
  end

  def tail
    "[#{@head&.key}, #{@head&.value}]"
  end

  def at(index)
    return if index.negative?
    node = node_at(index)
    "[#{node&.key}, #{node&.value}]"
  end

  def shift
    return 'nil' if @head.nil?
      
    removed = "[#{@head.key}, #{@head.value}]"
    @head = @head.next_node
    @tail = nil if @head.nil?
    removed
  end

  def pop
    return 'nil' if @head.nil?

    removed = "[#{@tail.key}, #{@tail.value}]"
    if @head == @tail
      @head = @tail = nil
    else
      @tail = node_at(size - 2)
      @tail.next_node = nil
    end
    removed
  end

  def contains?(key)
    node = @head
    until node.nil?
      return true if node.key == key
      node = node.next_node
    end
    false
  end

  def value_for_key(key)
    index = index(key)
    return nil if index == -1
    
    node = node_at(index)
    node.value
  end

  def index(key)
    node = @head
    current_index = 0
    until node.nil?
      return current_index if node.key == key
      current_index += 1
      node = node.next_node
    end
    return -1
  end

  def remove_at(index)
    return index_error if index.negative? || index > size
    
    if index.zero?
      shift
    else
      previous = node_at(index-1)
      removed = previous.next_node
      previous.next_node = removed.next_node
      @tail = previous if removed == @tail
    end
    "[#{removed.key}, #{removed.value}]"
  end

  def to_array
    node = @head
    array = []
    until node.nil?
      hash = Hash.new
      hash = {key: node.key, value: node.value}
      array << hash
      node = node.next_node
    end
    array
  end
  private

  def node_at(index)
    node = @head
    index.times { node = node&.next_node}
    node
  end

  def index_error
    warn "Index out of bounds"
  end

  class Node
    attr_accessor :key, :value, :next_node

    def initialize(key, value, next_node = nil)
      @key = key
      @value = value
      @next_node = next_node
    end
  end
end

