require 'rails_helper'

RSpec.describe "rep_votes/edit", :type => :view do
  before(:each) do
    @rep_vote = assign(:rep_vote, RepVote.create!(
      :rep_id => 1,
      :bill_id => 1,
      :vote => "MyString"
    ))
  end

  it "renders the edit rep_vote form" do
    render

    assert_select "form[action=?][method=?]", rep_vote_path(@rep_vote), "post" do

      assert_select "input#rep_vote_rep_id[name=?]", "rep_vote[rep_id]"

      assert_select "input#rep_vote_bill_id[name=?]", "rep_vote[bill_id]"

      assert_select "input#rep_vote_vote[name=?]", "rep_vote[vote]"
    end
  end
end
