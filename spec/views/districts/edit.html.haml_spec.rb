require 'rails_helper'

RSpec.describe "districts/edit", :type => :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :state => "MyString",
      :district => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders the edit district form" do
    render

    assert_select "form[action=?][method=?]", district_path(@district), "post" do

      assert_select "input#district_state[name=?]", "district[state]"

      assert_select "input#district_district[name=?]", "district[district]"

      assert_select "input#district_zip[name=?]", "district[zip]"
    end
  end
end
