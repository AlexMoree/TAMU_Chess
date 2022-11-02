# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

OmniAuth.config.silence_get_warning = true

RSpec.describe 'Authentication', type: :feature do
  before do
    Admin.create_or_find_by!(email: 'Alex_moree@tamu.edu')
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_admin]
    visit admin_google_oauth2_omniauth_authorize_path
  end
end

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
    Admin.create_or_find_by!(email: 'Alex_moree@tamu.edu')
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_admin]
    visit admin_google_oauth2_omniauth_authorize_path
  end
end

# RSpec.describe 'New Qr Code', type: :feature do
#   scenario 'valid inputs' do
#     visit new_qr_code_path

#     fill_in 'title', with: 'Example'
#     fill_in 'qr_url', with: 'https://example.com'

#     click_on 'Create Qr code'
#   end
# end

RSpec.describe 'Attendance', type: :feature do
  scenario 'valid inputs' do
    visit new_attendence_path
    fill_in 'Uin', with: '111111111'

    click_on 'Create Attendence'
  end
end
