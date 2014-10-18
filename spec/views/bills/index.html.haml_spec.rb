require 'rails_helper'

RSpec.describe "bills/index", :type => :view do
  before(:each) do
    assign(:bills, [
      Bill.create!(
        :bill_id => "Bill",
        :bill_uri => "Bill Uri",
        :title => "Title",
        :sponsor_uri => "Sponsor Uri",
        :cosponsors => "Cosponsors",
        :committees => "Committees",
        :latest_major_action => "MyText"
      ),
      Bill.create!(
        :bill_id => "Bill",
        :bill_uri => "Bill Uri",
        :title => "Title",
        :sponsor_uri => "Sponsor Uri",
        :cosponsors => "Cosponsors",
        :committees => "Committees",
        :latest_major_action => "MyText"
      )
    ])
  end

  it "renders a list of bills" do
    render
    assert_select "tr>td", :text => "Bill".to_s, :count => 2
    assert_select "tr>td", :text => "Bill Uri".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sponsor Uri".to_s, :count => 2
    assert_select "tr>td", :text => "Cosponsors".to_s, :count => 2
    assert_select "tr>td", :text => "Committees".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
