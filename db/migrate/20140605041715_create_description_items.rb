class CreateDescriptionItems < ActiveRecord::Migration
  def change
    create_table :description_items do |t|
      t.string :title, limit: 75, null: false
      t.text :long_description, limit: 4294967295, null: false
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
