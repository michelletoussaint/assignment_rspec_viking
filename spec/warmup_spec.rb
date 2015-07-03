
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

    let (:my_double) { instance_double("String") }

    it 'runs the upcase method' do

      expect(my_double).to receive(:upcase!)

      allow(my_double).to receive(:reverse!).and_return("olleH")

      w.calls_some_methods(my_double)

    end

    it 'runs the reverse method' do

      allow(my_double).to receive(:upcase!).and_return true

      expect(my_double).to receive(:reverse!)

      w.calls_some_methods(my_double)

    end

    it 'returns a set string' do

      expect(w.calls_some_methods('hello')).to eq('hahahaha this is a terrible method')
    end

    it "modifies a string" do

      a = "Hello"

      modified_a = "Hello"

      w.calls_some_methods(modified_a)

      expect(modified_a).to_not eq(a)

    end


  end

  
end