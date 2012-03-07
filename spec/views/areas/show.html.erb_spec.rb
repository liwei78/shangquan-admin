require 'spec_helper'

describe "areas/show" do
  before(:each) do
    @area = assign(:area, stub_model(Area))
  end

  it "renders attributes in <p>" do
    render
  end
end
