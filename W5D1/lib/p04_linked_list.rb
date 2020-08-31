class Node
  attr_reader :key
  attr_accessor :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if @head.next == @tail
      return nil
    end
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    head.next == tail
  end
  def get(key)
    runner = @head
    while(runner.next != nil)
      # p "KEY #{key}"
      # p "RUNNER #{runner.to_s}"
      if key == runner.key
        return runner.val
      else
        runner = runner.next
      end
    end
    nil
  end

  def include?(key)
    runner = @head
    while(runner.next != nil)
      if key == runner.key
        return true
      else
        runner = runner.next
      end
    end
    false
  end

  def append(key, val)
    #If head.val.nil? head.val = val; head.key=key
    node = Node.new(key,val)
 
    tail.prev.next = node 
    node.prev = tail.prev
    node.next = tail
    tail.prev = node 

  end

  def update(key, val)
    runner = @head
    while(runner.next != nil)
      if key == runner.key
        runner.val = val
        break
      else
        runner = runner.next
      end
    end
    nil
  end

  def remove(key)
    runner = @head
    while(runner.next != nil)
      if key == runner.key
        runner.prev.next = runner.next #1=>3
        runner.next.prev = runner.prev #3=>1
        break
      else
        runner = runner.next
      end
    end
    nil
  end
  # H-1-2-3-T
  # key : {second =>2}
  # runner.prev.next = runner.next #1=>3
  # runner.next.prev = runner.prev #3=>1

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

