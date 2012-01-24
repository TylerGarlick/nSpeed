class CompanyAdmin::SubmittalStatusesController < CompanyAdminController

  expose(:company) { current_user.company }
  expose(:project)
  expose(:submittal_statuses) {project.submittal_statuses}
  expose(:submittal_status)

  def index
  end

  def new
  end

  def create
    project.submittal_statuses << submittal_status
    if project.save
      redirect_to company_admin_project_submittal_statuses_url(project), :notice => "Submittal Status #{submittal_status.name} was created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if submittal_status.update_attributes(params[:submittal_status])
      redirect_to company_admin_project_submittal_statuses_url(project), :notice => "Submittal Status #{submittal_status.name} was updated successfully."
    else
      render :edit
    end
  end

  def destroy
    submittal_status.destroy
    redirect_to company_admin_project_submittal_statuses_url(project), :notice => "Submittal Status #{submittal_status.name} was deleted successfully."
  end
end