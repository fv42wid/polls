require 'rails_helper'

RSpec.describe "UserPolls", :type => :request do
  describe "GET /user_polls" do
    it "works! (now write some real specs)" do
      get user_polls_path
      expect(response.status).to be(200)
    end
  end
end
