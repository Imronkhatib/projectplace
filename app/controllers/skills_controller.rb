class SkillsController < ApplicationController

  def index
    skills = Skill.all
    render json: skills.as_json
  end

  def show
    skill = Skill.find_by(id: params[:id])
    render json: skill.as_json
  end
end
