require_relative "../node"

RSpec.describe Node do

  let(:node) {Node.new(10)}

  describe "Attributes" do
    it "Element is readable" do
      expect(node.element).to be 10
    end

    it "Element is unwritable" do
      expect{node.element = 3}.to raise_error(NoMethodError)
    end

    it "Next is unreadable" do
      expect{node.next}.to raise_error(NoMethodError)
    end

    it "Next is unwritable" do
      expect{node.next}.to raise_error(NoMethodError)
    end
  end

  describe "Next" do
    it "Links to other nodes" do
      expect(Node.new(12).link(node).element).to eq 12
    end
  end

end
