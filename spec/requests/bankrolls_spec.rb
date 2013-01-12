require 'spec_helper'

describe "Bankrolls" do
  describe "GET /bankrolls" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get bankrolls_path
      response.status.should be(200)
    end
  end
end
