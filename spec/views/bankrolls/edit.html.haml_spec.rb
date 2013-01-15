require 'spec_helper'

describe "bankrolls/edit" do
  before(:each) do
    @bankroll = assign(:bankroll, stub_model(Bankroll,
      :purchase => "MyString",
      :brief => "MyText",
      :card => "MyString",
      :rosemary => false,
      :jordon => false
    ))
  end

  it "renders the edit bankroll form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bankrolls_path(@bankroll), :method => "post" do
      assert_select "input#bankroll_purchase", :name => "bankroll[purchase]"
      assert_select "textarea#bankroll_brief", :name => "bankroll[brief]"
      assert_select "input#bankroll_card", :name => "bankroll[card]"
      assert_select "input#bankroll_rosemary", :name => "bankroll[rosemary]"
      assert_select "input#bankroll_jordon", :name => "bankroll[jordon]"
    end
  end
end
