# frozen_string_literal: true

require 'application_system_test_case'

class PaymentStatusesTest < ApplicationSystemTestCase
  setup do
    @payment_status = payment_statuses(:one)
  end

  test 'visiting the index' do
    visit payment_statuses_url
    assert_selector 'h1', text: 'Payment Statuses'
  end

  test 'creating a Payment status' do
    visit payment_statuses_url
    click_on 'New Payment Status'

    fill_in 'Student', with: @payment_status.student_id
    click_on 'Create Payment status'

    assert_text 'Payment status was successfully created'
    click_on 'Back'
  end

  test 'updating a Payment status' do
    visit payment_statuses_url
    click_on 'Edit', match: :first

    fill_in 'Student', with: @payment_status.student_id
    click_on 'Update Payment status'

    assert_text 'Payment status was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Payment status' do
    visit payment_statuses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Payment status was successfully destroyed'
  end
end
