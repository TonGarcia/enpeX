class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :name
      t.string :acronym
      t.string :description

      t.timestamps
    end
  end
end
