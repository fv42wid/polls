require 'rails_helper'

RSpec.describe "bills/show", :type => :view do
  before(:each) do
    @bill = assign(:bill, Bill.create!(
      :bill_id => "Bill",
      :bill_uri => "Bill Uri",
      :title => "Title",
      :sponsor_uri => "Sponsor Uri",
      :cosponsors => "Cosponsors",
      :committees => "Committees",
      :latest_major_action => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Bill/)
    expect(rendered).to match(/Bill Uri/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Sponsor Uri/)
    expect(rendered).to match(/Cosponsors/)
    expect(rendered).to match(/Committees/)
    expect(rendered).to match(/MyText/)
  end
end
