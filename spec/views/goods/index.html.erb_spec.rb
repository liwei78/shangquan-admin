require 'spec_helper'

describe "goods/index" do
  before(:each) do
    assign(:goods, [
      stub_model(Good),
      stub_model(Good)
    ])
  end

  it "renders a list of goods" do
    render
  end
end
