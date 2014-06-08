class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :through, limit: 55, null: false
      t.string :type, limit: 55, null: false
      t.string :description, limit: 140, null: true

      t.timestamps
    end
  end
end
