class CompanyAdmin::PrerequisitesController < CompanyAdmin::CompanyAdminController
  expose(:company) { current_user.company}
  expose(:project)

  expose(:prerequisites) {project.prerequisites}
  expose(:prerequisite)

  def index
  end

  def new
  end

  def create
    project.prerequisites << prerequisite
    if project.save
      redirect_to company_admin_project_prerequisites_url(project), :notice => "Prerequisite #{prerequisite.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if prerequisite.update_attributes(params[:prerequisite])
      redirect_to company_admin_project_prerequisites_url(project), :notice => "Prerequisite #{prerequisite.name} was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    prerequisite.destroy
    redirect_to company_admin_project_prerequisites_url(project), :notice => "Prerequisite #{prerequisite.name} was deleted successfully!"
  end
end
