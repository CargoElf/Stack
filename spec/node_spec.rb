require_relative "../node"

RSpec.describe Node do

  let(:node) {Node.new(10)}

  describe "Element" do
    it "is readable" do
      expect(node.element).to be 10
    end

    it "is unwritable" do
      expect{node.element = 3}.to raise_error(NoMethodError)
    end
  end

  describe "Link" do
    it "Links to other nodes" do
      expect(Node.new(12).link(node).element).to eq 12
    end
  end

end
