require 'spec_helper'

describe "goods/edit" do
  before(:each) do
    @good = assign(:good, stub_model(Good))
  end

  it "renders the edit good form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goods_path(@good), :method => "post" do
    end
  end
end
