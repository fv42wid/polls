require 'rails_helper'

RSpec.describe "districts/index", :type => :view do
  before(:each) do
    assign(:districts, [
      District.create!(
        :state => "State",
        :district => "District",
        :zip => "Zip"
      ),
      District.create!(
        :state => "State",
        :district => "District",
        :zip => "Zip"
      )
    ])
  end

  it "renders a list of districts" do
    render
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
  end
end
