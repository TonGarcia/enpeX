require "spec_helper"

describe DescriptionItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/description_items").should route_to("description_items#index")
    end

    it "routes to #new" do
      get("/description_items/new").should route_to("description_items#new")
    end

    it "routes to #show" do
      get("/description_items/1").should route_to("description_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/description_items/1/edit").should route_to("description_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/description_items").should route_to("description_items#create")
    end

    it "routes to #update" do
      put("/description_items/1").should route_to("description_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/description_items/1").should route_to("description_items#destroy", :id => "1")
    end

  end
end
