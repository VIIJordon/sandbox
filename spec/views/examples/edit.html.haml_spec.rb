require 'spec_helper'

describe "examples/edit" do
  before(:each) do
    @example = assign(:example, stub_model(Example,
      :name => "MyString",
      :brief => "MyText",
      :show => false
    ))
  end

  it "renders the edit example form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => examples_path(@example), :method => "post" do
      assert_select "input#example_name", :name => "example[name]"
      assert_select "textarea#example_brief", :name => "example[brief]"
      assert_select "input#example_show", :name => "example[show]"
    end
  end
end
