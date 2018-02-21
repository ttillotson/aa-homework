require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) {Dessert.new("Souffle", 3, "chef")}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Souffle")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("Pancake", "lolli", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.add_ingredient("pasta")).to eq(["pasta"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"do
    ingredients = ["snips", "snails", "puppy dog tails"]

    ingredients.each do |ingredient|
      dessert.add_ingredient(ingredient)
    end

    expect(dessert.ingredients).to eq(ingredients)
    dessert.mix!
    expect(dessert.ingredients).to_not eq(ingredients)
    expect(dessert.ingredients.sort).to eq(ingredients.sort)
    end
  end


  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to eq(1)
    end

    it "raises an error if the amount is greater than the quantity" do
      # dessert.eat(80000)
      expect{dessert.eat(80000)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      dessert.serve
      allow(chef).to receive(:titleize).and_return("Chef")
      expect(dessert.serve).to eq("Chef has made 3 Souffles!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
