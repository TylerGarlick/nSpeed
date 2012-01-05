class SubmittalsController < ApplicationController
  expose(:project)
  expose(:project_requirements) { project.project_requirements }

  expose(:submittals) {
    if params[:project_requirement_id].nil? || params[:project_requirement_id].empty?
      project.project_requirements.first.submittals
    else
      ProjectRequirement.find(params[:project_requirement_id]).submittals
    end
  }

  expose(:submittal)

  def index

  end

  def show

  end

  def new
  end

  def create
    submittal.user = current_user
    if submittal.save
      redirect_to project_submittals_url(project), :notice => "Submittal was created successfully!"
    else
      render :new
    end
  end
end
