class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.date :start_date
      t.date :end_date
      t.integer :created_by
      t.integer :assigned_to
      t.integer :project_id
      t.timestamps
    end
  end
end
