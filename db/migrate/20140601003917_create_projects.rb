class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, limit: 50, null: false
      t.string :alias_name, limit: 50, null: false
      t.string :resume, limit: 144, null: false
      t.string :url_video, limit: 50, null: true
      t.boolean :active, default: true, null: false
      t.references :creator, index: true
      t.belongs_to :project_type

      t.timestamps
    end
  end
end
