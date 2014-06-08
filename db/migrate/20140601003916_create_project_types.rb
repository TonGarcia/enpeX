class CreateProjectTypes < ActiveRecord::Migration
  def change
    create_table :project_types do |t|
      t.string :name, limit: 30, null: false
      t.string :description, limit: 30, null: true

      t.timestamps
    end
  end
end
