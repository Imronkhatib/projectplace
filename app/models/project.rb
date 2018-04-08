class Project < ApplicationRecord
  has_many :project_skills
  has_many :project_users

  def as_json
    {
      name: name,
      description: description,
      project_type: project_type,
      start_date: start_date,
      end_date: end_date
    }
  end
end
