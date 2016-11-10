require_relative "../reverse_polish_calculator"

RSpec.describe ReversePolishCalculator do

  let (:calc) { ReversePolishCalculator.new }

  it "Adds two numbers together" do
    expect(calc.run("2 1 +")).to eq 3
  end

  it "Subtracts two numbers" do
    expect(calc.run("2 1 -")).to eq 1
  end

  it "Divides two numbers" do
    expect(calc.run("12 3 /")).to eq 4
  end

  it "Mulitplies two numbers" do
    expect(calc.run("4 3 *")).to eq 12
  end

  it "Maths" do
    expect(calc.run("5 1 2 + 4 * + 3 -")).to eq 14
  end

  it "Returns error when there's too few on the stack" do
    expect{ calc.run("1 +") }.to raise_error(NotEnoughValues)
  end

  it "Returns error when there's many on the stack" do
    expect{ calc.run("7 5 1 2 + 4 * + 3 -") }.to raise_error(TooManyValues)
  end
end
