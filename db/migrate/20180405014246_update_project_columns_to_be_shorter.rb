class UpdateProjectColumnsToBeShorter < ActiveRecord::Migration[5.1]
  def change
    rename_column :projects, :project_name, :name
    rename_column :projects, :project_description, :description
    rename_column :projects, :project_type, :type
    rename_column :projects, :project_start_date, :start_date
    rename_column :projects, :project_end_date, :end_date
  end
end
