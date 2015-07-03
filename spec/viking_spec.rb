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

    it 'picks up a weapon' do

      bow = Bow.new
      expect(oleg.weapon).to be nil

      oleg.pick_up_weapon(bow)
      expect(oleg.weapon).to eq(bow)

    end

    specify 'picking up a non-weapon raises an exception' do

      expect{oleg.pick_up_weapon("bow")}.to raise_error("Can't pick up that thing")

    end

    it 'overwrites current weapon' do

      viking_4 = Viking.new("Sven", 120, 11, Bow.new)
      my_axe = Axe.new
      viking_4.pick_up_weapon(my_axe)
      expect(viking_4.weapon).to eq(my_axe)

    end

  end

  describe "#drop_weapon" do

    it "leaves the viking weaponless" do

      viking_4 = Viking.new("Sven", 120, 11, Bow.new)
      viking_4.drop_weapon
      expect(viking_4.weapon).to be nil

    end

  end

  describe "#receive attack" do

    it "reduces the viking's heatlh" do

      oleg.receive_attack(10)

      expect(oleg.health).to eq(90)

    end

    it "calls the #take_damage method" do

      expect(oleg).to receive(:take_damage)

      oleg.receive_attack(10)

    end

  end

  describe "#attack" do

    it "causes recipient's health to drop" do

      sven = Viking.new("Sven")

      oleg.attack(sven)

      expect(sven.health).to eq(97.5)

    end

  end

end