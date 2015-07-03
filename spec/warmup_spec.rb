
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

    it 'takes an argument as parameter'

      # expect(w.double_size('a'))to_

    end

    it 'returns an error if no argument is sent'

    it 'returns an array double the size'


  end


end