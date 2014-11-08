require 'rails_helper'

RSpec.describe "rep_votes/show", :type => :view do
  before(:each) do
    @rep_vote = assign(:rep_vote, RepVote.create!(
      :rep_id => 1,
      :bill_id => 2,
      :vote => "Vote"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Vote/)
  end
end
