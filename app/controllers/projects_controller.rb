class ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: projects.as_json 
  end

  def create
    new_project = Project.new(
      name: "The Golend Project",
      description: "This is the best project that's ever taken place, some would even say, it's as good as Projectplace.io",
      project_type: "A Web App",
      start_date: "04/01/2018", 
      end_date: "06/01/2018"
    )

    new_project.save
  end

  def show
    project = Project.find_by(id:params[:id])
    render json: project.as_json
  end



  def update
    project = Project.find_by(id: params[:id])
    project.update(
      name: params[:name],
      description: params[:description],
      project_type: params[:project_type],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
  end

  def delete
    project = Project.find_by(id: params[:id])

    project.delete

    render json: {message: 'Your project has been deleted'}
  end
end
