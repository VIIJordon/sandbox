require 'spec_helper'

describe "examples/show" do
  before(:each) do
    @example = assign(:example, stub_model(Example,
      :name => "Name",
      :brief => "MyText",
      :show => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
  end
end
