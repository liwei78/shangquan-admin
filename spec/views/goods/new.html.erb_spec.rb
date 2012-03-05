require 'spec_helper'

describe "goods/new" do
  before(:each) do
    assign(:good, stub_model(Good).as_new_record)
  end

  it "renders new good form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => goods_path, :method => "post" do
    end
  end
end
