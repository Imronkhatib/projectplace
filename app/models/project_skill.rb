class ProjectSkill < ApplicationRecord
  has_many :project_skills
  has_many :skills, through: :project_skills
  belongs_to :project
  belongs_to :skill 

end
