require 'spec_helper'

describe "form_types/edit" do
  before(:each) do
    @form_type = assign(:form_type, stub_model(FormType,
      :name => "MyString",
      :show => false,
      :brief => "MyText"
    ))
  end

  it "renders the edit form_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => form_types_path(@form_type), :method => "post" do
      assert_select "input#form_type_name", :name => "form_type[name]"
      assert_select "input#form_type_show", :name => "form_type[show]"
      assert_select "textarea#form_type_brief", :name => "form_type[brief]"
    end
  end
end
