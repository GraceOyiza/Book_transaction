require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    described_class.new(name: 'Graduation Party')
  end

  it 'will be invalid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'validations' do
      it { should validate_length_of(:name).is_at_least(3) }
  end

describe 'Associations' do
    scenario { should belong_to(:creator) }
    scenario { should have_many(:books) }
    scenario { should have_many(:book_groups) }
    scenario { should have_one_attached(:icon) }
  end
end
