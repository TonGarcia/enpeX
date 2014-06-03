class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :value
      t.float :discounted_value
      t.float :card_tax
      t.float :company_tax # CAPTAR TAX
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
