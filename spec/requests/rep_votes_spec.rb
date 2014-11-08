require 'rails_helper'

RSpec.describe "RepVotes", :type => :request do
  describe "GET /rep_votes" do
    it "works! (now write some real specs)" do
      get rep_votes_path
      expect(response.status).to be(200)
    end
  end
end
