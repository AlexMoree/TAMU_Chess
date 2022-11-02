# frozen_string_literal: true

require 'test_helper'

class PersonalInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_information = personal_informations(:one)
  end

  test 'should get index' do
    get personal_informations_url
    assert_response :success
  end

  test 'should get new' do
    get new_personal_information_url
    assert_response :success
  end

  test 'should create personal_information' do
    assert_difference('PersonalInformation.count') do
      post personal_informations_url, params: { personal_information: { Student_id: @personal_information.Student_id } }
    end

    assert_redirected_to personal_information_url(PersonalInformation.last)
  end

  test 'should show personal_information' do
    get personal_information_url(@personal_information)
    assert_response :success
  end

  test 'should get edit' do
    get edit_personal_information_url(@personal_information)
    assert_response :success
  end

  test 'should update personal_information' do
    patch personal_information_url(@personal_information), params: { personal_information: { Student_id: @personal_information.Student_id } }
    assert_redirected_to personal_information_url(@personal_information)
  end

  test 'should destroy personal_information' do
    assert_difference('PersonalInformation.count', -1) do
      delete personal_information_url(@personal_information)
    end

    assert_redirected_to personal_informations_url
  end
end
