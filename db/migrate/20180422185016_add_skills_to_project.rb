class AddSkillsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :skills, :string
  end
end
