class ProjectUsersController < ApplicationController

  def index
    project_users = ProjectUser.all

    render json: project_users.as_json
  end

  # def create
  #   if current_user
  #   Project.find_by(id:)
  #   project_user = ProjectUser.create!(
  #       user_id: params[current_user.id],
  #       project_id: params[]
  #     )
  #   else
  #     render json: {message: "You must log in"}
  #   end
  # end

end
