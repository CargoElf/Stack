class Node
  attr_reader :element

  def initialize(element)
    @element = element
    @next = nil
  end

  def link(other_node)
    @next = other_node
    self
  end

  def remove
    @next
  end

end
