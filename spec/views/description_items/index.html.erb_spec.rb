require 'spec_helper'

describe "description_items/index" do
  before(:each) do
    assign(:description_items, [
      stub_model(DescriptionItem,
        :title => "Title",
        :long_description => "Long Description",
        :project => nil
      ),
      stub_model(DescriptionItem,
        :title => "Title",
        :long_description => "Long Description",
        :project => nil
      )
    ])
  end

  it "renders a list of description_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Long Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
