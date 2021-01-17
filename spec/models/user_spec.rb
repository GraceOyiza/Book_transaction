require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(username: 'Graduation Party')
  end

  it 'will be invalid without a name' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  describe 'User associations' do
    it { should have_many(:books).without_validating_presence }
    it { should have_many(:groups).without_validating_presence }

  end
end
