require 'rails_helper'

RSpec.describe "logins/index", type: :view do
  before(:each) do
    assign(:logins, [
      Login.create!(
        username: "Username",
        password: "Password"
      ),
      Login.create!(
        username: "Username",
        password: "Password"
      )
    ])
  end

  it "renders a list of logins" do
    render
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
  end
end
