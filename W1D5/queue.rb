class Queue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    queue << el
  end

  def dequeue
    queue.shift
    queue
  end

  def show
    queue
  end
end
