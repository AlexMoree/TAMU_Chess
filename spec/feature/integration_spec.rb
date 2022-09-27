# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a new personal information account', type: :feature do
  scenario 'valid inputs' do
    visit new_personal_information_path
    fill_in 'Student', with: '1111111111'
    fill_in 'First name', with: 'Jared'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Classification', with: 'Construction Engineering'
    fill_in 'Major', with: 'Freshmam'
    click_on 'Create Personal Information'
    visit personal_informations_path
    expect(page).to have_content('1111111111')
    expect(page).to have_content('Jared')
    expect(page).to have_content('Smith')
    expect(page).to have_content('Construction Engineering')
    expect(page).to have_content('Freshmam')

  end
end