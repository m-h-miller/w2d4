def mw_naive(arr, window_size)
  i = 0
  max_window_size = 0
  (1 + arr.length - window_size).times do
    maximum = arr[i...(i+window_size)].max
    minimum = arr[i...(i+window_size)].min
    current = maximum - minimum
    max_window_size = current if current > max_window_size
    i += 1
  end

  max_window_size
end

class MyStack
  def initialize
    @max_stack = []
    @min_stack = []
    @store = []
  end

  def pop

    @max_stack.pop
    @min_stack.pop
    @store.pop

  end

  def push(el)

    unless @max_stack.empty?
      @max_stack.last > el ? @max_stack << @max_stack.last : @max_stack << el
    else
      @max_stack << el
    end

    unless @min_stack.empty?
      @min_stack.last < el ? @min_stack << @min_stack.last : @min_stack << el
    else
      @min_stack << el
    end

    @store << el
  end

  def peek
    return @store.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

  def max
    @max_stack.last
  end

  def min
    @min_stack.last
  end

end

class StackQueue
  def initialize
    @pushstack = MyStack.new
    @popstack = MyStack.new
  end

  def enqueue(el)
    @pushstack.push(el)
  end

  def dequeue
    if @popstack.empty?
      until @pushstack.empty?
        @popstack.push(@pushstack.pop)
      end
    end

    @popstack.pop
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end
