class AddNewFieldsToProjectTable < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :key_responsibilities, :string
    add_column :projects, :minimum_requirements, :string
    add_column :projects, :budget, :integer
  end
end
