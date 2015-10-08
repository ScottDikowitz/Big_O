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
