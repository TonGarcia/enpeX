require 'spec_helper'

describe "description_items/edit" do
  before(:each) do
    @description_item = assign(:description_item, stub_model(DescriptionItem,
      :title => "MyString",
      :long_description => "MyString",
      :project => nil
    ))
  end

  it "renders the edit description_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", description_item_path(@description_item), "post" do
      assert_select "input#description_item_title[name=?]", "description_item[title]"
      assert_select "input#description_item_long_description[name=?]", "description_item[long_description]"
      assert_select "input#description_item_project[name=?]", "description_item[project]"
    end
  end
end
