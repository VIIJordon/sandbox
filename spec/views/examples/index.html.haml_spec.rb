require 'spec_helper'

describe "examples/index" do
  before(:each) do
    assign(:examples, [
      stub_model(Example,
        :name => "Name",
        :brief => "MyText",
        :show => false
      ),
      stub_model(Example,
        :name => "Name",
        :brief => "MyText",
        :show => false
      )
    ])
  end

  it "renders a list of examples" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
