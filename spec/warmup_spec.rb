
require_relative '../lib/warmup.rb'

describe Warmup do

  let (:w){Warmup.new}

  describe '#gets_shout' do

    it 'gets an input and sets it to uppercase' do

      allow(w).to receive(:gets).and_return('hello')

      expect(w.gets_shout).to eq("HELLO")

    end

  end

  describe '#double_size' do

    let(:my_double) { instance_double("Array", 'size' => 2) }

    it 'takes an argument as parameter' do

      expect{w.double_size('a')}.to_not raise_error

    end

    it 'returns an error if no argument is sent' do

      expect{w.double_size}.to raise_error(ArgumentError)

    end

    it 'returns double the length of the array' do

      expect(w.double_size(my_double)).to eq(4)

    end

  end

  describe '#calls_some_method' do

    # let (:my_double) {double('upcase'=>)}

    it 'runs the upcase method' do 

      # allow(w).to receive(:upcase).and_return("HELLO")

      # expect(w.calls_some_methods("hello")).to receive(:upcase).and_return("HELLO")

      # expect(w.calls_some_methods("bye")).to receive(:upcase!)
      # w.calls_some_methods("hello")

    end

    it 'runs the reverse method'

    it 'returns a set string' do

      expect(w.calls_some_methods('hello')).to eq('hahahaha this is a terrible method')
    end


  end

  
end