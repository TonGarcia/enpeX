require 'spec_helper'

describe "transactions/edit" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :value => 1.5,
      :user => nil,
      :project => nil
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do
      assert_select "input#transaction_value[name=?]", "transaction[value]"
      assert_select "input#transaction_user[name=?]", "transaction[user]"
      assert_select "input#transaction_project[name=?]", "transaction[project]"
    end
  end
end
