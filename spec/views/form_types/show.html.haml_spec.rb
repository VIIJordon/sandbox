require 'spec_helper'

describe "form_types/show" do
  before(:each) do
    @form_type = assign(:form_type, stub_model(FormType,
      :name => "Name",
      :show => false,
      :brief => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/false/)
    rendered.should match(/MyText/)
  end
end
