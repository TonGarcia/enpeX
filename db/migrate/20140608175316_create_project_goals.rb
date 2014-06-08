class CreateProjectGoals < ActiveRecord::Migration
  def change
    create_table :project_goals do |t|
      t.decimal :value, :decimal, precision: 9, scale: 2, null: false
      t.string :justification, limit: 140, null: true
      t.belongs_to :currency
      t.belongs_to :project

      t.timestamps
    end
  end
end
