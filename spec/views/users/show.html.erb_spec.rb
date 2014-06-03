require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :username => "Username",
      :email => "Email",
      :gender => "Gender",
      :locale => "Locale"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Username/)
    rendered.should match(/Email/)
    rendered.should match(/Gender/)
    rendered.should match(/Locale/)
  end
end
