class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :project_users

  def as_json 
    {
      name: name,
      email: email
    }
  end
end
