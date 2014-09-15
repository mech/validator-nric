RSpec.describe Validator::Nric do

  describe 'check' do
    it 'returns false if nric is nil' do
      expect(subject.check(nil)).to be false
    end

    it 'returns false if nric has less than 9 characters' do
      expect(subject.check('ABC')).to be false
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
      expect(subject.lookup('S', 10)).to eq 'A'
    end
  end

end
