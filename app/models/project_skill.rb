class ProjectSkill < ApplicationRecord
  # has_many :project_skills
  belongs_to :project
  belongs_to :skill 

end
