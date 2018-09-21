require 'rails_helper'

RSpec.describe NaturalDocketSeed, type: :model do
  let(:invalid_seed) { described_class.new }
  let(:valid_seed)   { 
    create(:natural_docket_seed, 
      issue: create(:basic_issue),
      nationality: 'CO',
      gender: GenderKind.find_by_code('female'),
      marital_status: MaritalStatusKind.find_by_code('single')
  )}

  it 'is not valid without an issue' do
    expect(invalid_seed).to_not be_valid
  end

  it 'is valid with an issue' do
    expect(valid_seed).to be_valid
  end

  it 'does not allow assigning to an issue that already has one' do
    seed = create(:full_natural_docket_seed_with_issue).reload

    invalid = build(:full_natural_docket_seed, issue: seed.issue.reload)
    invalid.should_not be_valid
    invalid.errors[:base].should == ["cannot_create_more_than_one_per_issue"]
  end

  it 'cannot save if issue is not active anymore' do
    seed = create(:full_natural_docket_seed_with_issue).reload
    seed.issue.approve!
    seed.first_name = "An update here"
    seed.should_not be_valid
    seed.errors[:base].should == ['no_more_updates_allowed']
  end
end
