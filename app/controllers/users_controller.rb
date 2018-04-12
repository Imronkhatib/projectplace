class UsersController < ApplicationController

  def index
    user = User.all
    render json: user.as_json  
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user.as_json
  end

  def create
    user = User.create(
      name: params[:name],
     email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
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


