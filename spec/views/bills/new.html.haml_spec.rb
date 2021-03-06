require 'rails_helper'

RSpec.describe "bills/new", :type => :view do
  before(:each) do
    assign(:bill, Bill.new(
      :bill_id => "MyString",
      :bill_uri => "MyString",
      :title => "MyString",
      :sponsor_uri => "MyString",
      :cosponsors => "MyString",
      :committees => "MyString",
      :latest_major_action => "MyText"
    ))
  end

  it "renders new bill form" do
    render

    assert_select "form[action=?][method=?]", bills_path, "post" do

      assert_select "input#bill_bill_id[name=?]", "bill[bill_id]"

      assert_select "input#bill_bill_uri[name=?]", "bill[bill_uri]"

      assert_select "input#bill_title[name=?]", "bill[title]"

      assert_select "input#bill_sponsor_uri[name=?]", "bill[sponsor_uri]"

      assert_select "input#bill_cosponsors[name=?]", "bill[cosponsors]"

      assert_select "input#bill_committees[name=?]", "bill[committees]"

      assert_select "textarea#bill_latest_major_action[name=?]", "bill[latest_major_action]"
    end
  end
end
