class CompanyAdmin::ProjectsController < ApplicationController
  expose(:company) {current_user.company}
  expose(:project_types) {company.project_types.order(:name)}
  expose(:customers) {company.customers.order(:name)}
  expose(:projects) {company.projects.order(:name)}
  expose(:project)

  def index
  end

  def new
  end

  def create
    company.projects << project
    if company.save
      redirect_to company_admin_projects_url, :notice => "Project #{project.project_number} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if project.update_attributes(params[:project])
      redirect_to company_admin_projects_url, :notice => "Project #{project.project_number} was updated successfully!"
    else
      render :new
    end
  end

  def destroy
    
  end
end
