require 'rails_helper'

RSpec.describe "reps/show", :type => :view do
  before(:each) do
    @rep = assign(:rep, Rep.create!(
      :nyt_id => "Nyt",
      :first_name => "First Name",
      :last_name => "Last Name",
      :rep_url => "Rep Url",
      :role => "Role",
      :gender => "Gender",
      :party => "Party",
      :twitter_id => "Twitter",
      :youtube_id => "Youtube",
      :seniority => 1,
      :govtrack_id => "Govtrack",
      :state => "State",
      :district => "District"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nyt/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Rep Url/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/Party/)
    expect(rendered).to match(/Twitter/)
    expect(rendered).to match(/Youtube/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Govtrack/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/District/)
  end
end
