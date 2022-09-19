require "application_system_test_case"

class PersonalInformationsTest < ApplicationSystemTestCase
  setup do
    @personal_information = personal_informations(:one)
  end

  test "visiting the index" do
    visit personal_informations_url
    assert_selector "h1", text: "Personal Informations"
  end

  test "creating a Personal information" do
    visit personal_informations_url
    click_on "New Personal Information"

    fill_in "Student", with: @personal_information.Student_id
    click_on "Create Personal information"

    assert_text "Personal information was successfully created"
    click_on "Back"
  end

  test "updating a Personal information" do
    visit personal_informations_url
    click_on "Edit", match: :first

    fill_in "Student", with: @personal_information.Student_id
    click_on "Update Personal information"

    assert_text "Personal information was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal information" do
    visit personal_informations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal information was successfully destroyed"
  end
end
