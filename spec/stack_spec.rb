require_relative "../node"
require_relative "../stack"

RSpec.describe Stack do

  let (:stack) { Stack.new }

  def set_stack(element = 0)
    return stack if element == 4
    p stack.push(element)
    set_stack(element += 1)
  end

  describe "Push" do
    it "Adds to the top of the stack" do
      stack.push(0)
      expect(stack.push(1).element).to eq 1
    end
  end

  describe "Pop" do
    it "Takes from the top of the stack" do
      expect(set_stack.pop).to eq 3
    end
  end

end
