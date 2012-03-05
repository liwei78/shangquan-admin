require 'spec_helper'

describe "goods/show" do
  before(:each) do
    @good = assign(:good, stub_model(Good))
  end

  it "renders attributes in <p>" do
    render
  end
end
