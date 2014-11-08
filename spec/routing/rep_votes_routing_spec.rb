require "rails_helper"

RSpec.describe RepVotesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rep_votes").to route_to("rep_votes#index")
    end

    it "routes to #new" do
      expect(:get => "/rep_votes/new").to route_to("rep_votes#new")
    end

    it "routes to #show" do
      expect(:get => "/rep_votes/1").to route_to("rep_votes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rep_votes/1/edit").to route_to("rep_votes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rep_votes").to route_to("rep_votes#create")
    end

    it "routes to #update" do
      expect(:put => "/rep_votes/1").to route_to("rep_votes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rep_votes/1").to route_to("rep_votes#destroy", :id => "1")
    end

  end
end
