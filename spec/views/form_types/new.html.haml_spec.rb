require 'spec_helper'

describe "form_types/new" do
  before(:each) do
    assign(:form_type, stub_model(FormType,
      :name => "MyString",
      :show => false,
      :brief => "MyText"
    ).as_new_record)
  end

  it "renders new form_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => form_types_path, :method => "post" do
      assert_select "input#form_type_name", :name => "form_type[name]"
      assert_select "input#form_type_show", :name => "form_type[show]"
      assert_select "textarea#form_type_brief", :name => "form_type[brief]"
    end
  end
end
