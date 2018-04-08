class User < ApplicationRecord
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :project_users

  def as_json 
    {
      first_name: first_name,
      last_name: last_name,
      email: email
    }
  end
end
