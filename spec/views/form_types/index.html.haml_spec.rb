require 'spec_helper'

describe "form_types/index" do
  before(:each) do
    assign(:form_types, [
      stub_model(FormType,
        :name => "Name",
        :show => false,
        :brief => "MyText"
      ),
      stub_model(FormType,
        :name => "Name",
        :show => false,
        :brief => "MyText"
      )
    ])
  end

  it "renders a list of form_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
