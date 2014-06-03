require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :username => "MyString",
      :email => "MyString",
      :gender => "MyString",
      :locale => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_username[name=?]", "user[username]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_gender[name=?]", "user[gender]"
      assert_select "input#user_locale[name=?]", "user[locale]"
    end
  end
end
