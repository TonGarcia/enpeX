class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name, limit: 50, null: false
      t.string :acronym, limit: 5, null: false

      t.timestamps
    end
  end
end
