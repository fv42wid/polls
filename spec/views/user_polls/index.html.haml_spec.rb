require 'rails_helper'

RSpec.describe "user_polls/index", :type => :view do
  before(:each) do
    assign(:user_polls, [
      UserPoll.create!(),
      UserPoll.create!()
    ])
  end

  it "renders a list of user_polls" do
    render
  end
end
