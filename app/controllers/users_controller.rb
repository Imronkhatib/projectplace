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
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email]
    )

    render json: {message: "You've created a user"}
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


