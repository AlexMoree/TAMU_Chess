# frozen_string_literal: true

require 'test_helper'

class AttendencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendence = attendences(:one)
  end

  test 'should get index' do
    get attendences_url
    assert_response :success
  end

  test 'should get new' do
    get new_attendence_url
    assert_response :success
  end

  test 'should create attendence' do
    assert_difference('Attendence.count') do
      post attendences_url, params: { attendence: { attendence: @attendence.attendence, event_date: @attendence.event_date, event_id: @attendence.event_id, event_name: @attendence.event_name } }
    end

    assert_redirected_to attendence_url(Attendence.last)
  end

  test 'should show attendence' do
    get attendence_url(@attendence)
    assert_response :success
  end

  test 'should get edit' do
    get edit_attendence_url(@attendence)
    assert_response :success
  end

  test 'should update attendence' do
    patch attendence_url(@attendence),
          params: { attendence: { attendence: @attendence.attendence, event_date: @attendence.event_date, event_id: @attendence.event_id, event_name: @attendence.event_name } }
    assert_redirected_to attendence_url(@attendence)
  end

  test 'should destroy attendence' do
    assert_difference('Attendence.count', -1) do
      delete attendence_url(@attendence)
    end

    assert_redirected_to attendences_url
  end
end
