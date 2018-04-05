class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_description
      t.string :project_type
      t.string :project_start_date
      t.string :project_end_date

      t.timestamps
    end
  end
end
