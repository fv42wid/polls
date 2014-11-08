require 'rails_helper'

RSpec.describe "districts/show", :type => :view do
  before(:each) do
    @district = assign(:district, District.create!(
      :state => "State",
      :district => "District",
      :zip => "Zip"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/State/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/Zip/)
  end
end
