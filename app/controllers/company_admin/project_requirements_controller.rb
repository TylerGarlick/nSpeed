class CompanyAdmin::ProjectRequirementsController < CompanyAdmin::CompanyAdminController
  expose(:company) { current_user.company }
  expose(:project)
  expose(:prerequisites) { project.prerequisites }

  expose(:project_requirements) { project.project_requirements }
  expose(:project_requirement)

  def index
  end

  def new
  end

  def create
    project.project_requirements << project_requirement
    if project.save
      redirect_to company_admin_project_project_requirements_url(project), :notice => "Requirement #{project_requirement.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if project.update_attributes(params[:project_requirement])
      redirect_to company_admin_project_project_requirements_url(project), :notice => "Requirement #{project_requirement.name} was updated successfully!"
    else
      render :new
    end
  end

  def destroy
    project_requirement.destroy
    redirect_to company_admin_project_project_requirements_url(project), :notice => "Requirement #{project_requirement.name} was deleted successfully!"
  end
end
