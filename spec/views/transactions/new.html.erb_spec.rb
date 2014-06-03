require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :value => 1.5,
      :user => nil,
      :project => nil
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transactions_path, "post" do
      assert_select "input#transaction_value[name=?]", "transaction[value]"
      assert_select "input#transaction_user[name=?]", "transaction[user]"
      assert_select "input#transaction_project[name=?]", "transaction[project]"
    end
  end
end
