class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def add(el)
    stack << el
  end

  def remove
    stack.pop
    stack
  end

  def show
    stack
  end

end
