require './lib/nnd'

describe Nnd do

  subject { Nnd.new(99, 97) }

  describe 'input' do

    context 'non-zero integers used as input' do
      it 'will be fine' do
        expect{ subject }.not_to raise_error
      end
    end

    context 'zero used as input' do
      subject(:zero_first) { Nnd.new(0, 99) }
      subject(:zero_last) { Nnd.new(99, 0) }

      it 'will raise an error when zero used as first input' do
        expect { zero_first }.to raise_error
      end

      it 'will raise an error when zero used as second input' do
        expect { zero_second }.to raise_error
      end
    end
  end

  describe 'processing' do
    it 'will correctly calculate the value'
  end

  describe 'output' do
    it 'will show correct answer'
    it 'will show both inputs'
    it 'will show first step to work out base'
    it 'will show second step to work simple multiplication'
  end
end
