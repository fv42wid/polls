require 'rails_helper'

RSpec.describe "reps/new", :type => :view do
  before(:each) do
    assign(:rep, Rep.new(
      :nyt_id => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :rep_url => "MyString",
      :role => "MyString",
      :gender => "MyString",
      :party => "MyString",
      :twitter_id => "MyString",
      :youtube_id => "MyString",
      :seniority => 1,
      :govtrack_id => "MyString",
      :state => "MyString",
      :district => "MyString"
    ))
  end

  it "renders new rep form" do
    render

    assert_select "form[action=?][method=?]", reps_path, "post" do

      assert_select "input#rep_nyt_id[name=?]", "rep[nyt_id]"

      assert_select "input#rep_first_name[name=?]", "rep[first_name]"

      assert_select "input#rep_last_name[name=?]", "rep[last_name]"

      assert_select "input#rep_rep_url[name=?]", "rep[rep_url]"

      assert_select "input#rep_role[name=?]", "rep[role]"

      assert_select "input#rep_gender[name=?]", "rep[gender]"

      assert_select "input#rep_party[name=?]", "rep[party]"

      assert_select "input#rep_twitter_id[name=?]", "rep[twitter_id]"

      assert_select "input#rep_youtube_id[name=?]", "rep[youtube_id]"

      assert_select "input#rep_seniority[name=?]", "rep[seniority]"

      assert_select "input#rep_govtrack_id[name=?]", "rep[govtrack_id]"

      assert_select "input#rep_state[name=?]", "rep[state]"

      assert_select "input#rep_district[name=?]", "rep[district]"
    end
  end
end
