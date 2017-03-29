RSpec.describe Validator::Nric do
  describe 'check' do
    it 'returns false if nric is nil' do
      expect(subject.check(nil)).to be false
    end

    it 'returns false if nric has less than 9 characters' do
      expect(subject.check('ABC')).to be false
    end

    it 'return false if nric has an unexpected start character' do
      expect(subject.check('111111111')).to be false
      expect(subject.check('XXXXXXXXX')).to be false
    end
  end

  describe 'mod' do
    it 'sums the product of IC number with weighted array and % 11' do
      expect(subject.mod('1111111')).to eq 7
    end

    it 'sums the product of IC number with weighted array and % 11' do
      expect(subject.mod('1234567')).to eq 7
    end
  end

  describe 'lookup' do
    it 'retrieves the compared character from lookup table' do
      expect(subject.lookup('S', 0)).to eq 'J'
      expect(subject.lookup('S', 1)).to eq 'Z'
      expect(subject.lookup('S', 2)).to eq 'I'
      expect(subject.lookup('S', 3)).to eq 'H'
      expect(subject.lookup('S', 4)).to eq 'G'
      expect(subject.lookup('S', 5)).to eq 'F'
      expect(subject.lookup('S', 6)).to eq 'E'
      expect(subject.lookup('S', 7)).to eq 'D'
      expect(subject.lookup('S', 8)).to eq 'C'
      expect(subject.lookup('S', 9)).to eq 'B'
      expect(subject.lookup('S', 10)).to eq 'A'
    end
  end
end
