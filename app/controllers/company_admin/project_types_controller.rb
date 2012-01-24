class CompanyAdmin::ProjectTypesController < CompanyAdmin::CompanyAdminController
  expose(:company) {current_user.company}
  expose(:project_types) {company.project_types.paginate(:page => params[:page])}
  expose(:project_type)

  def index
  end

  def show
  end

  def new
  end

  def create
    company.project_types << project_type
    if company.save
      redirect_to company_admin_project_types_url, :notice => "Project Type #{project_type.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if project_type.update_parameters[:project_type]
      redirect_to company_admin_project_types_url, :notice => "Project Type #{project_type.name} was created successfully!"
    else
      render :edit
    end
  end

  def destroy
  end
end
