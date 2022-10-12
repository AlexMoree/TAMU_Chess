require 'rails_helper'

RSpec.describe "logins/edit", type: :view do
  before(:each) do
    @login = assign(:login, Login.create!(
      username: "MyString",
      password: "MyString"
    ))
  end

  it "renders the edit login form" do
    render

    assert_select "form[action=?][method=?]", login_path(@login), "post" do

      assert_select "input[name=?]", "login[username]"

      assert_select "input[name=?]", "login[password]"
    end
  end
end
