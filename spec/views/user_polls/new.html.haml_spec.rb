require 'rails_helper'

RSpec.describe "user_polls/new", :type => :view do
  before(:each) do
    assign(:user_poll, UserPoll.new())
  end

  it "renders new user_poll form" do
    render

    assert_select "form[action=?][method=?]", user_polls_path, "post" do
    end
  end
end
