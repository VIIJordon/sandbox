require 'spec_helper'

describe "bankrolls/new" do
  before(:each) do
    assign(:bankroll, stub_model(Bankroll,
      :purchase => "MyString",
      :brief => "MyText",
      :card => "MyString",
      :rosemary => false,
      :jordon => false
    ).as_new_record)
  end

  it "renders new bankroll form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bankrolls_path, :method => "post" do
      assert_select "input#bankroll_purchase", :name => "bankroll[purchase]"
      assert_select "textarea#bankroll_brief", :name => "bankroll[brief]"
      assert_select "input#bankroll_card", :name => "bankroll[card]"
      assert_select "input#bankroll_rosemary", :name => "bankroll[rosemary]"
      assert_select "input#bankroll_jordon", :name => "bankroll[jordon]"
    end
  end
end
