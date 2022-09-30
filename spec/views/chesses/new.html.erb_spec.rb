require 'rails_helper'

RSpec.describe "chesses/new", type: :view do
  before(:each) do
    assign(:chess, Chess.new(
      chess_com_username: "MyString",
      blitz: 1,
      rapid: 1,
      total_played: 1
    ))
  end

  it "renders new chess form" do
    render

    assert_select "form[action=?][method=?]", chesses_path, "post" do

      assert_select "input[name=?]", "chess[chess_com_username]"

      assert_select "input[name=?]", "chess[blitz]"

      assert_select "input[name=?]", "chess[rapid]"

      assert_select "input[name=?]", "chess[total_played]"
    end
  end
end
