require 'rails_helper'

RSpec.describe "statistics/show", type: :view do
  before(:each) do
    @statistic = assign(:statistic, Statistic.create!(
      actual_name: "Actual Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Actual Name/)
  end
end
