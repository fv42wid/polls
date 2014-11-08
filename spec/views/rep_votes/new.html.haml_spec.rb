require 'rails_helper'

RSpec.describe "rep_votes/new", :type => :view do
  before(:each) do
    assign(:rep_vote, RepVote.new(
      :rep_id => 1,
      :bill_id => 1,
      :vote => "MyString"
    ))
  end

  it "renders new rep_vote form" do
    render

    assert_select "form[action=?][method=?]", rep_votes_path, "post" do

      assert_select "input#rep_vote_rep_id[name=?]", "rep_vote[rep_id]"

      assert_select "input#rep_vote_bill_id[name=?]", "rep_vote[bill_id]"

      assert_select "input#rep_vote_vote[name=?]", "rep_vote[vote]"
    end
  end
end
