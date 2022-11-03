# frozen_string_literal: true

require 'application_system_test_case'

class QrCodesTest < ApplicationSystemTestCase
  setup do
    @qr_code = qr_codes(:one)
  end

  test 'visiting the index' do
    visit qr_codes_url
    assert_selector 'h1', text: 'Qr Codes'
  end

  test 'creating a Qr code' do
    visit qr_codes_url
    click_on 'New Qr Code'

    fill_in 'Attendence link', with: @qr_code.attendence_link
    fill_in 'Event', with: @qr_code.event_id
    fill_in 'Signup link', with: @qr_code.signup_link
    click_on 'Create Qr code'

    assert_text 'Qr code was successfully created'
    click_on 'Back'
  end

  test 'updating a Qr code' do
    visit qr_codes_url
    click_on 'Edit', match: :first

    fill_in 'Attendence link', with: @qr_code.attendence_link
    fill_in 'Event', with: @qr_code.event_id
    fill_in 'Signup link', with: @qr_code.signup_link
    click_on 'Update Qr code'

    assert_text 'Qr code was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Qr code' do
    visit qr_codes_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Qr code was successfully destroyed'
  end
end
