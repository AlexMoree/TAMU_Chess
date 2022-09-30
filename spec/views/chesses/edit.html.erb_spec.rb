require 'rails_helper'

RSpec.describe "chesses/edit", type: :view do
  before(:each) do
    @chess = assign(:chess, Chess.create!(
      chess_com_username: "MyString",
      blitz: 1,
      rapid: 1,
      total_played: 1
    ))
  end

  it "renders the edit chess form" do
    render

    assert_select "form[action=?][method=?]", chess_path(@chess), "post" do

      assert_select "input[name=?]", "chess[chess_com_username]"

      assert_select "input[name=?]", "chess[blitz]"

      assert_select "input[name=?]", "chess[rapid]"

      assert_select "input[name=?]", "chess[total_played]"
    end
  end
end
