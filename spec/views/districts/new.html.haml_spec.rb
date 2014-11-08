require 'rails_helper'

RSpec.describe "districts/new", :type => :view do
  before(:each) do
    assign(:district, District.new(
      :state => "MyString",
      :district => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders new district form" do
    render

    assert_select "form[action=?][method=?]", districts_path, "post" do

      assert_select "input#district_state[name=?]", "district[state]"

      assert_select "input#district_district[name=?]", "district[district]"

      assert_select "input#district_zip[name=?]", "district[zip]"
    end
  end
end
