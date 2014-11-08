require 'rails_helper'

RSpec.describe "rep_votes/index", :type => :view do
  before(:each) do
    assign(:rep_votes, [
      RepVote.create!(
        :rep_id => 1,
        :bill_id => 2,
        :vote => "Vote"
      ),
      RepVote.create!(
        :rep_id => 1,
        :bill_id => 2,
        :vote => "Vote"
      )
    ])
  end

  it "renders a list of rep_votes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Vote".to_s, :count => 2
  end
end
