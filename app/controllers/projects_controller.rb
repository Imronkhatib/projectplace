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
      project = Project.create(
        name: params[:name],
        description: params[:description],
        project_type: params[:project_type],
        start_date: params[:start_date],
        end_date: params[:end_date],
        admin_id: current_user.id
      )


      project_user = ProjectUser.create(
          user_id: current_user.id,
          project_id: project.id
        )

      skill = Skill.find_by(name:params[:skills])
      print skill.id
      ProjectSkill.create!(project_id: project.id, skill_id:skill.id)
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
