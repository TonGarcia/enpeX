class CreateSocialSessions < ActiveRecord::Migration
  def change
    create_table :social_sessions do |t|
      t.integer :id_on_social
      t.belongs_to :user
      t.belongs_to :social_network

      t.timestamps
    end
  end
end
