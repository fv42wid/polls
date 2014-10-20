require "rails_helper"

RSpec.describe UserPollsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_polls").to route_to("user_polls#index")
    end

    it "routes to #new" do
      expect(:get => "/user_polls/new").to route_to("user_polls#new")
    end

    it "routes to #show" do
      expect(:get => "/user_polls/1").to route_to("user_polls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_polls/1/edit").to route_to("user_polls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_polls").to route_to("user_polls#create")
    end

    it "routes to #update" do
      expect(:put => "/user_polls/1").to route_to("user_polls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_polls/1").to route_to("user_polls#destroy", :id => "1")
    end

  end
end
