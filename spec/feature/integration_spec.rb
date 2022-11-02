# location: spec/feature/integration_spec.rb
require 'rails_helper'

OmniAuth.config.test_mode = true



RSpec.describe 'New Personal Information', type: :feature do
  scenario 'valid inputs' do
    visit new_personal_information_path
    fill_in 'Uin', with: '111111111'
    fill_in 'First name', with: 'Carson'
    fill_in 'Last name', with: 'Utils'
    fill_in 'Email', with: 'Carson_Utils@tamu.edu'
    fill_in 'Discord username', with: 'Carson#11500'
    fill_in 'Chess com username', with: 'Carson'
    fill_in 'Lichess org username', with: 'Carson'
    click_on 'Create Personal information'
    visit personal_informations_path
    expect(page).to have_content('111111111')
    expect(page).to have_content('Carson')
    expect(page).to have_content('Utils')
    expect(page).to have_content('Carson_Utils@tamu.edu')
    expect(page).to have_content('Carson#11500')
    expect(page).to have_content('Carson')
  end
end

RSpec.describe 'New Qr Code', type: :feature do
  scenario 'valid inputs' do
    visit new_qr_code_path  

    fill_in 'title', with: 'Example'
    fill_in 'qr_url', with: 'https://example.com'

    click_on 'Create Qr code'
    visit qr_codes_path

    expect(page).to have_content('Example')
  end
end

RSpec.describe 'Attendance', type: :feature do
  scenario 'valid inputs' do

    visit new_attendence_path
    fill_in 'Uin', with: '111111111'

    click_on 'Create Attendence'
    visit attendences_path

    expect(page).to have_content('111111111')
  end
end