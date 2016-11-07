class Stack

  def initialize
    @entire_stack = nil
  end

  def push(element)
    new_node = Node.new(element)
    if @entire_stack
      new_node.link(@entire_stack)
      @entire_stack = new_node
    else
      @entire_stack = new_node
    end
  end

  def pop
    old_top = @entire_stack
    @entire_stack = old_top.remove
    old_top.element
  end

  def top
    @entire_stack.element
  end

  def empty?
    @entire_stack
  end

end
