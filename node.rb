class Node
  attr_accessor :element

  def initialize(element)
    @element = element
    @next = nil
  end

  def link(other_node)
    @next = other_node
  end

  def remove
    self.next
  end

end
