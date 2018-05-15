class UsersController < ApplicationController

  def index
    user = User.all
    render json: user.as_json  
  end

  def show
    user = User.find_by(id: current_user.id)
    render json: user.as_json
  end

  def create
    user = User.create(
      name: params[:name],
      email: params[:email],
      user_name: params[:user_name],
      bio: params[:bio],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      skill = Skill.find_by(name:params[:skills])
      UserSkill.create!(user_id:user.id, skill_id:skill.id)
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :unprocessible_entity
    end
  end
 
  def update
    user = User.find_by(id: params[:id])
    user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )   
  end
end


