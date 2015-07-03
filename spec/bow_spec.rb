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

end