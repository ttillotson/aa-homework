require 'byebug'
require 'rspec'
require 'lru'

RSpec.describe LRUCache do
  subject(:lru) {LRUCache.new(4)}

  describe "#initialize" do

    it "creates a cache" do
      expect(lru.show).to eq([])
    end

    it "has a default max length" do
      expect{LRUCache.new}.not_to raise_error
    end

    it "accepts a max length" do
      expect{LRUCache.new(5)}.not_to raise_error
    end
  end

  describe "#count" do
    it "returns the length of the cache" do
      expect(lru.count).to be(0)
    end
  end

  describe "#show" do
    before(:each) do
      lru.add("hello world")
      lru.add({:symbolic => :symbols})
      lru.add(983)
    end

    it "shows the oldest to the left" do
      expect(lru.show).to eq(["hello world",{:symbolic => :symbols}, 983])
    end

    it "returns a frozen copy of the cache" do
      expect(lru.show.frozen?).to be true
      expect{lru.add(90)}.not_to raise_error
      expect{lru.show << 89}.to raise_error(FrozenError)
    end
  end

  describe "#add" do

    it "can add an element" do
      expect(lru.add("hi")).to eq(["hi"])
    end

    it "doesn't add a copy of any element" do
      lru.add(90)
      lru.add("hello_world")
      lru.add(90)
      expect(lru.count).to be(2)
    end

    it "doesn't exceed the max limit" do
      lru.add("pizza")
      lru.add("hello world")
      lru.add({:symbolic => :symbols})
      lru.add(983)
      lru.add([[1], [2], [3]])
      lru.add(3.14)
      expect(lru.count).to be(4)
    end
  end
end
