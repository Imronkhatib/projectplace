class Project < ApplicationRecord
  has_many :project_skills
  has_many :skills, through: :project_skills
  has_many :project_users
  has_many :users, through: :project_users


  def as_json
    {
      name: name,
      description: description,
      skills: skills,
      project_type: project_type,
      start_date: start_date,
      end_date: end_date, 
      id: id
    }
  end
end
