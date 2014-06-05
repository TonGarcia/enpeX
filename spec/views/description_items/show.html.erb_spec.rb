require 'spec_helper'

describe "description_items/show" do
  before(:each) do
    @description_item = assign(:description_item, stub_model(DescriptionItem,
      :title => "Title",
      :long_description => "Long Description",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Long Description/)
    rendered.should match(//)
  end
end
