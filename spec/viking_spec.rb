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

  let (:sven) {Viking.new("Sven",100,10,Bow.new)}

  describe "#attack" do

    it "causes recipient's health to drop" do

      oleg.attack(sven)

      expect(sven.health).to be < (100)

    end

    it "calls the #take_damage method" do

      expect(oleg).to receive(:take_damage)

      sven.attack(oleg)

    end

    specify "attacking with no weapon runs damage_with_fists" do

      expect(oleg).to receive(:damage_with_fists).and_return(5)

      oleg.attack(sven)

    end

    specify "attacking with no weapon deals fists multiplier times strength" do

      oleg.attack(sven)

      expect(sven.health).to eq(97.5)

    end

    specify "attacking with weapon runs #damage_with_weapon" do

      expect(sven).to receive(:damage_with_weapon).and_return(50)

      sven.attack(oleg)

    end

    specify "attacking with a weapon deals weapon multiplier times strength" do

      sven.attack(oleg)

      expect(oleg.health).to eq(80)

    end

    it "attacks with fists when out of arrows" do

      new_guy = Viking.new("new_viking", 100,10,Bow.new(0))

      expect(new_guy).to receive(:damage_with_fists).and_return(2.5)

      new_guy.attack(oleg)

      # expect(oleg.health).to eq(97.5)

    end

  end

  describe "#check_death" do

    let(:peter) { Viking.new("Peter", 1) }

    it "raises an error when a viking dies" do

      expect{peter.receive_attack(10)}.to raise_error("#{peter.name} has Died...")

    end

    it "raises an error when killing a viking" do

      expect{oleg.attack(peter)}.to raise_error("#{peter.name} has Died...")

    end

  end

end