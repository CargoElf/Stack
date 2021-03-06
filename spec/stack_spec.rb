require_relative "../stack"

RSpec.describe Stack do

  let (:stack) { Stack.new }

  def set_stack(element = 0)
    return stack if element == 4
    stack.push(element)
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

    it "Can pop multiple times" do
      set_stack.pop
      expect(stack.pop).to eq 2
    end

    it "Returns nil if nothing in stack" do
      expect(Stack.new.pop).to eq nil
    end

    it "Returns the last element if there is only one in stack" do
      one_stack = Stack.new
      one_stack.push(10)
      expect(one_stack.pop).to eq 10
    end

    it "Removes the last element if there is only one in stack" do
      one_stack = Stack.new
      one_stack.push(10)
      one_stack.pop
      expect(one_stack.empty?).to be true
    end
  end

  describe "Top" do
    it "Returns the top element of the stack" do
      expect(set_stack.top).to eq  3
    end

    it "Doesn't remove the top element" do
      set_stack.top
      expect(set_stack.top).to eq 3
    end

    it "Returns nil if empty" do
      expect(Stack.new.top).to eq nil
    end
  end

  describe "Empty?" do
    it "Returns true if stack is empty" do
      expect(stack.empty?).to eq true
    end

    it "Resturns false if not empty" do
      set_stack
      expect(stack.empty?).to eq false
    end
  end


end
