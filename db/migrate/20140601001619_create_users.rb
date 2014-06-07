class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, limit: 55, null: false
      t.string :email, limit: 55, null: false
      t.string :academic_email, limit: 55, null: true
      t.string :pass_salt, limit: 29, null: false
      t.string :password, limit: 60, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :academic_email, unique: true
  end
end
