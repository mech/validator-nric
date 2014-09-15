RSpec.describe Validator::Nric do

  describe 'check' do
    it 'raises error if characters are less than 9' do
      expect do
        subject.check('ABC')
      end.to raise_error ArgumentError
    end
  end

end
