require 'rails_helper'

RSpec.describe "user_polls/edit", :type => :view do
  before(:each) do
    @user_poll = assign(:user_poll, UserPoll.create!())
  end

  it "renders the edit user_poll form" do
    render

    assert_select "form[action=?][method=?]", user_poll_path(@user_poll), "post" do
    end
  end
end
