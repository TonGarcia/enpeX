require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :description => "MyString",
      :url_video => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_description[name=?]", "project[description]"
      assert_select "input#project_url_video[name=?]", "project[url_video]"
      assert_select "input#project_user[name=?]", "project[user]"
    end
  end
end
