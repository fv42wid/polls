require 'rails_helper'

RSpec.describe "user_polls/show", :type => :view do
  before(:each) do
    @user_poll = assign(:user_poll, UserPoll.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
