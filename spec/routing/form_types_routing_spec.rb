require "spec_helper"

describe FormTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/form_types").should route_to("form_types#index")
    end

    it "routes to #new" do
      get("/form_types/new").should route_to("form_types#new")
    end

    it "routes to #show" do
      get("/form_types/1").should route_to("form_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/form_types/1/edit").should route_to("form_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/form_types").should route_to("form_types#create")
    end

    it "routes to #update" do
      put("/form_types/1").should route_to("form_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/form_types/1").should route_to("form_types#destroy", :id => "1")
    end

  end
end
