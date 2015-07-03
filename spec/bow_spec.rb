require_relative "../lib/weapons/bow.rb"

describe Bow do

  let(:my_bow) { Bow.new }

  describe "#initialize" do

    specify "arrow variable is readable" do

      expect{my_bow.arrows}.to_not raise_error

    end

    it "starts with 10 arrows by default" do

      expect(my_bow.arrows).to eq(10)

    end

    it "can start with a specified number of arrows" do

      my_bow_2 = Bow.new(20)

      expect(my_bow_2.arrows).to eq(20)

    end

  end

  describe "#use" do 

    it "reduces arrows by 1" do

      my_bow.use
      expect(my_bow.arrows).to eq(9)

    end

    it "throws an error if you use with no arrows left" do 

      my_bow_2 = Bow.new(0)
      expect{my_bow_2.use}.to raise_error("Out of arrows")

    end

  end

end