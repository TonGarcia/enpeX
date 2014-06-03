require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :name => "Name",
        :description => "Description",
        :url_video => "Url Video",
        :user => nil
      ),
      stub_model(Project,
        :name => "Name",
        :description => "Description",
        :url_video => "Url Video",
        :user => nil
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Url Video".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
