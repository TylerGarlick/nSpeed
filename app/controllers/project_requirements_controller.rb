class ProjectRequirementsController < ApplicationController
  expose(:project)
  expose(:project_requirements) {project.project_requirements.order(:ordinal)}
  expose(:project_requirement)

  def index
  end

  def show
  end

  def new
  end

  def create
    project.project_requirements << project_requirement
    if project.save
      redirect_to project_project_requirements_url, :notice => "Project Requirement #{project_requirement.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if project_requirement.update_attributes(params[:project_requirement])
      redirect_to project_project_requirements_url, :notice => "Project Requirement #{project_requirement.name} was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    project_requirement.destroy!
    redirect_to project_project_requirements_url, :notice => "Project Requirement #{project_requirement.name} was deleted successfully!"
  end
end
