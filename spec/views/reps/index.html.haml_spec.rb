require 'rails_helper'

RSpec.describe "reps/index", :type => :view do
  before(:each) do
    assign(:reps, [
      Rep.create!(
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
      ),
      Rep.create!(
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
      )
    ])
  end

  it "renders a list of reps" do
    render
    assert_select "tr>td", :text => "Nyt".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Rep Url".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "Party".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Youtube".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Govtrack".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
  end
end
