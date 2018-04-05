class Skill < ApplicationRecord
  has_many :user_skills
  has_many :users, through: :user_skills
  has_many :project_skills
  has_many :projects, through: :project_skills
end
