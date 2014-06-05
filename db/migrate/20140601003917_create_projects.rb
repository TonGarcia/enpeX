class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, limit: 50, null: false
      t.string :resume, limit: 144, null: false
      t.string :url_video, limit: 50, null: true
      t.references :creator, index: true

      t.timestamps
    end
  end
end
