require "application_system_test_case"

class LichessesTest < ApplicationSystemTestCase
  setup do
    @lichess = lichesses(:one)
  end

  test "visiting the index" do
    visit lichesses_url
    assert_selector "h1", text: "Lichesses"
  end

  test "creating a Lichess" do
    visit lichesses_url
    click_on "New Lichess"

    fill_in "Draw", with: @lichess.draw
    fill_in "Loss", with: @lichess.loss
    fill_in "Rank", with: @lichess.rank
    fill_in "Student", with: @lichess.student_id
    fill_in "Total played", with: @lichess.total_played
    fill_in "Username", with: @lichess.username
    fill_in "Win", with: @lichess.win
    click_on "Create Lichess"

    assert_text "Lichess was successfully created"
    click_on "Back"
  end

  test "updating a Lichess" do
    visit lichesses_url
    click_on "Edit", match: :first

    fill_in "Draw", with: @lichess.draw
    fill_in "Loss", with: @lichess.loss
    fill_in "Rank", with: @lichess.rank
    fill_in "Student", with: @lichess.student_id
    fill_in "Total played", with: @lichess.total_played
    fill_in "Username", with: @lichess.username
    fill_in "Win", with: @lichess.win
    click_on "Update Lichess"

    assert_text "Lichess was successfully updated"
    click_on "Back"
  end

  test "destroying a Lichess" do
    visit lichesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lichess was successfully destroyed"
  end
end
