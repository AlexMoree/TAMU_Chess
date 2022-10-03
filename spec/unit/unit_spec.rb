# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(Attendence, type: :model) do
  subject do
    described_class.new(uin: '1010001101', day_of_event: '10/2/2022')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without both' do
    subject.uin = nil
    subject.day_of_event = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a uin' do
    subject.uin = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a date' do
    subject.day_of_event = nil
    expect(subject).not_to be_valid
  end
end