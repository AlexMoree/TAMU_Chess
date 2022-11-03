# frozen_string_literal: true

require 'test_helper'

class QrCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @qr_code = qr_codes(:one)
  end

  test 'should get index' do
    get qr_codes_url
    assert_response :success
  end

  test 'should get new' do
    get new_qr_code_url
    assert_response :success
  end

  test 'should create qr_code' do
    assert_difference('QrCode.count') do
      post qr_codes_url, params: { qr_code: { attendence_link: @qr_code.attendence_link, event_id: @qr_code.event_id, signup_link: @qr_code.signup_link } }
    end

    assert_redirected_to qr_code_url(QrCode.last)
  end

  test 'should show qr_code' do
    get qr_code_url(@qr_code)
    assert_response :success
  end

  test 'should get edit' do
    get edit_qr_code_url(@qr_code)
    assert_response :success
  end

  test 'should update qr_code' do
    patch qr_code_url(@qr_code), params: { qr_code: { attendence_link: @qr_code.attendence_link, event_id: @qr_code.event_id, signup_link: @qr_code.signup_link } }
    assert_redirected_to qr_code_url(@qr_code)
  end

  test 'should destroy qr_code' do
    assert_difference('QrCode.count', -1) do
      delete qr_code_url(@qr_code)
    end

    assert_redirected_to qr_codes_url
  end
end
