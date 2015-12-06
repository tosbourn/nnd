require './lib/nnd'

class ToSpec
  def show(content)
    Array(content)
  end
end

describe Nnd do

  subject { Nnd.new(99, 97, ToSpec.new) }

  describe 'input' do

    context 'non-zero integers used as input' do
      it 'will be fine' do
        expect{ subject }.not_to raise_error
      end
    end

    context 'zero or less used as input' do
      subject(:zero_first) { Nnd.new(0, 99) }
      subject(:zero_last) { Nnd.new(99, 0) }
      subject(:less_than_zero_first) { Nnd.new(-12, 99) }
      subject(:less_than_zero_last) { Nnd.new(99, -10) }

      it 'will raise an error when zero used as first input' do
        expect { zero_first }.to raise_error(InvalidNumbers)
      end

      it 'will raise an error when zero used as second input' do
        expect { zero_last }.to raise_error(InvalidNumbers)
      end

      it 'will raise an error when less than zero is used as first input' do
        expect { less_than_zero_last }.to raise_error(InvalidNumbers)
      end

      it 'will raise an error when less than zero is used as second input' do
        expect { less_than_zero_last }.to raise_error(InvalidNumbers)
      end
    end
  end

  describe 'output' do
    it 'will show correct answer' do
      expect(subject.output_answer).to include("Answer: 9603")
    end

    it 'will show both inputs' do
      expect(subject.output_answer).to include("Original Multiplication: 99 * 97")
    end

    it 'will show first step to work out base' do
      expect(subject.output_answer).to include("Using Base: 100")
    end

    it 'will show second step to work simple multiplication' do
      expect(subject.output_answer).to include("Multiplied out differences padded with zeros: 03")
    end

    it 'will show third step to work out the starting number plus difference' do
      expect(subject.output_answer).to include("The first number added to the second number's difference: 96")
    end
  end

  # Some numbers that didn't seem right at various stages.
  # The test suite runs so fast I am happy to leave them in.
  describe 'edge cases' do
    it 'will correctly work out 9 * 9' do
      expect(Nnd.new(9, 9, ToSpec.new).output_answer).to include("Answer: 81")
    end


    it 'will correct work out 444 * 333' do
      expect(Nnd.new(444, 333, ToSpec.new).output_answer).to include("Answer: 147852")
    end

    it 'will correct work out 104 * 98' do
      expect(Nnd.new(104, 98, ToSpec.new).output_answer).to include("Answer: 10192")
    end
  end
end
