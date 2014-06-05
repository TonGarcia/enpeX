require 'spec_helper'

describe "description_items/new" do
  before(:each) do
    assign(:description_item, stub_model(DescriptionItem,
      :title => "MyString",
      :long_description => "MyString",
      :project => nil
    ).as_new_record)
  end

  it "renders new description_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", description_items_path, "post" do
      assert_select "input#description_item_title[name=?]", "description_item[title]"
      assert_select "input#description_item_long_description[name=?]", "description_item[long_description]"
      assert_select "input#description_item_project[name=?]", "description_item[project]"
    end
  end
end
