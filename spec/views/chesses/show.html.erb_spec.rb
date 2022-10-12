require 'rails_helper'

RSpec.describe "chesses/show", type: :view do
  before(:each) do
    @chess = assign(:chess, Chess.create!(
      chess_com_username: "Chess Com Username",
      blitz: 2,
      rapid: 3,
      total_played: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Chess Com Username/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
