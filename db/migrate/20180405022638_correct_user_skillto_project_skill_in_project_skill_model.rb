class CorrectUserSkilltoProjectSkillInProjectSkillModel < ActiveRecord::Migration[5.1]
  def change
    rename_column :project_skills, :user_id, :project_id
  end
end
