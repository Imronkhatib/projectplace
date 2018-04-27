class ProjectUsersController < ApplicationController

  def index
    project_users = ProjectUser.all

    render json: project_users.as_json
  end

  def create
    
    project_user = ProjectUser.create!(
        user_id: current_user.id,
        project_id: params[:project_id]
      )
    # else
      # render json: {message: "You must log in"}
    # end
  end

end
