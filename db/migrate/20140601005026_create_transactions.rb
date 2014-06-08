class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :value, :decimal, precision: 9, scale: 2, null: false
      t.boolean :banking, null: false
      t.references :payer, index: true, null: false
      t.references :receiver, index: true, null: false
      t.belongs_to :payment_method, index: true, null: false
      t.belongs_to :currency, index: true, null: false

      t.timestamps
    end
  end
end
