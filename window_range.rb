def windowed_max_range(array, window_size)
  current_max_range = nil

  (0..array.length - window_size).each do |i|
    sub_array = array[i...i + window_size]
    range = sub_array.max - sub_array.min

    if current_max_range.nil? || range > current_max_range
      current_max_range = range
    end
  end

  current_max_range
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    store.pop
  end

  def push(val)
    store.push(val)
  end

  def peek
    store.last
  end

  def size
    store.length
  end

  def empty?
    store.length == 0
  end

  private
  attr_reader :store
end

class MinMaxStack
  Node = Struct.new(:value, :max, :min)

  attr_reader :max, :min
  def initialize
    @store = []
    @max, @min = nil, nil
  end

  def pop
    node = store.pop
    @max, @min = node.max, node.min
    node.value
  end

  def push(val)
    node = Node.new(val, max, min)

    if max.nil? || val > max
      @max = val
    end

    if min.nil? || val < min
      @min = val
    end

    store.push(node)
  end

  def peek
    store.last.value
  end

  def size
    store.length
  end

  def empty?
    store.length == 0
  end

  private
  attr_reader :store
end

class StackQueue
  def initialize
    @bottom, @top = MyStack.new, MyStack.new
  end

  def enqueue(val)
    bottom.push(val)
  end

  def dequeue
    if top.empty?
      until bottom.empty?
        top.push(bottom.pop)
      end
    end

    top.pop
  end

  def size
    bottom.size + top.size
  end

  def empty?
    size == 0
  end

  private
  attr_reader :bottom, :top
end

class MinMaxStackQueue
  def initialize
    @bottom, @top = MinMaxStack.new, MinMaxStack.new
  end

  def enqueue(val)
    bottom.push(val)
  end

  def dequeue
    if top.empty?
      until bottom.empty?
        top.push(bottom.pop)
      end
    end

    top.pop
  end

  def size
    bottom.size + top.size
  end

  def empty?
    size == 0
  end

  def max
    unless bottom.max.nil? || top.max.nil?
      [bottom.max, top.max].max
    else
      bottom.max || top.max
    end

  end

  def min
    unless bottom.min.nil? || top.min.nil?
      [bottom.min, top.min].min
    else
      bottom.min || top.min
    end
  end

  private
  attr_reader :bottom, :top
end

def windowed_max_range(array, window_size)
  window = MinMaxStackQueue.new
  (0...window_size).each do |i|
    window.enqueue(array[i])
  end

  max_range = window.max - window.min

  (window_size...array.length).each do |i|
    window.enqueue(array[i])
    window.dequeue
    range = window.max - window.min
    max_range = range if range > max_range
  end

  max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
