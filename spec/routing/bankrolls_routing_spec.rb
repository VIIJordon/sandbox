require "spec_helper"

describe BankrollsController do
  describe "routing" do

    it "routes to #index" do
      get("/bankrolls").should route_to("bankrolls#index")
    end

    it "routes to #new" do
      get("/bankrolls/new").should route_to("bankrolls#new")
    end

    it "routes to #show" do
      get("/bankrolls/1").should route_to("bankrolls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/bankrolls/1/edit").should route_to("bankrolls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/bankrolls").should route_to("bankrolls#create")
    end

    it "routes to #update" do
      put("/bankrolls/1").should route_to("bankrolls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/bankrolls/1").should route_to("bankrolls#destroy", :id => "1")
    end

  end
end
