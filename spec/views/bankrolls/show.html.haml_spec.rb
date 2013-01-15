require 'spec_helper'

describe "bankrolls/show" do
  before(:each) do
    @bankroll = assign(:bankroll, stub_model(Bankroll,
      :purchase => "Purchase",
      :brief => "MyText",
      :card => "Card",
      :rosemary => false,
      :jordon => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Purchase/)
    rendered.should match(/MyText/)
    rendered.should match(/Card/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
