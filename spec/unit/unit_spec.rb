# location: spec/unit/unit_spec.rb
require 'rails_helper'

OmniAuth.config.test_mode = true

RSpec.describe(Attendence, type: :model) do
  subject do
    described_class.new(uin: '101111009', day_of_event: '10/2/2022')
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

RSpec.describe(QrCode, type: :model) do
  subject do
    described_class.new(title: 'Example Website Link', qr_url: 'https://example.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without both' do
    subject.title = nil
    subject.qr_url = nil
    expect(subject).not_to be_valid

  end
  it 'is not valid without a uin' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a date' do
    subject.qr_url = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe(PersonalInformation, type: :model) do
  subject do
    described_class.new(uin: '101111009', first_name: 'Carson',last_name: 'Util',
    email: 'Carson_Util@tamu.edu',discord_username: 'Carson#11000',membership: '1',
    start_date: '1/1/2022',end_date: '12/1/2022',
    chess_com_username: 'Carson100',lichess_org_username: 'Carson100')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without both' do
    subject.uin = nil
    subject.first_name = nil
    subject.last_name = nil
    subject.email = nil
    subject.discord_username = nil
    subject.membership = nil
    subject.end_date = nil
    subject.start_date = nil
    subject.chess_com_username = nil
    subject.lichess_org_username = nil
    expect(subject).not_to be_valid
  end
end