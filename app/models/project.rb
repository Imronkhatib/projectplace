class Project < ApplicationRecord
  has_many :project_skills
  has_many :project_users
end
