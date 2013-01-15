require 'spec_helper'

describe "bankrolls/index" do
  before(:each) do
    assign(:bankrolls, [
      stub_model(Bankroll,
        :purchase => "Purchase",
        :brief => "MyText",
        :card => "Card",
        :rosemary => false,
        :jordon => false
      ),
      stub_model(Bankroll,
        :purchase => "Purchase",
        :brief => "MyText",
        :card => "Card",
        :rosemary => false,
        :jordon => false
      )
    ])
  end

  it "renders a list of bankrolls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Purchase".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Card".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
