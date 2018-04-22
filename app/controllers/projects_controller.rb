class ProjectsController < ApplicationController

  def index
    if current_user
      projects = current_user.projects
      render json: projects.as_json 
    else
      render json: {message: "Please log in to view your projects"}
    end
  end

  def create
    if current_user
      project = Project.new(
        name: params[:name],
        description: params[:description],
        project_type: params[:project_type],
        start_date: params[:start_date],
        end_date: params[:end_date],
        admin_id: current_user.id
      )

      project.save

      project_user = ProjectUser.new(
          user_id: current_user.id,
          project_id: project.id
        )
      
      project_user.save
    else
      render json: {message: "You must log in"}
    end
  end

  def show
    project = Project.find_by(id:params[:id])
    render json: project.as_json
  end



  def update
    project = Project.find_by(id: params[:id])
    if current_user.id == project.admin_id
      project.update(
        name: params[:name],
        description: params[:description],
        project_type: params[:project_type],
        start_date: params[:start_date],
        end_date: params[:end_date]
      )
    else
      render json: {message: "You must be the admin to edit "}
    end
  end

  def delete
    project = Project.find_by(id: params[:id])

    project.delete

    render json: {message: 'Your project has been deleted'}
  end
end
