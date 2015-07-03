require_relative "../lib/viking.rb"

describe Viking do

  let (:oleg) {Viking.new}

  describe '#initialize' do

    it 'sets the name attribute' do

      thor = Viking.new("Thor")
      expect(thor.name).to eq("Thor")

    end

    it 'passing a health attribute sets instance variable health' do

      viking_3 = Viking.new("John",50)
      expect(viking_3.health).to eq(50)

    end

    specify 'health cannot be overwritten after set' do

      expect(oleg).not_to respond_to(:health=)

    end

    specify 'viking weapon starts at nil by default' do

      expect(oleg.weapon).to be nil

    end

  end

  describe "#pick_up_weapon" do

    it 'overrides the current weapon' do

      bow = Bow.new
      expect(oleg.weapon).to be nil

      oleg.pick_up_weapon(bow)
      expect(oleg.weapon).to eq(bow)

    end

    specify 'picking up a non-weapon raises an exception' do

      expect{oleg.pick_up_weapon("bow")}.to raise_error("Can't pick up that thing")

    end

  end

end