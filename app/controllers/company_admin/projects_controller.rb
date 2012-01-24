class CompanyAdmin::ProjectsController < CompanyAdmin::CompanyAdminController

  expose(:company) {current_user.company}
  expose(:project_types) {company.project_types.order(:name)}
  expose(:customers) {company.customers.order(:name)}
  expose(:projects) {company.projects.order(:name)}
  expose(:project)

  def index
  end

  def show
    
  end

  def new
  end

  def create
    save_roles
    company.projects << project
    if company.save
      redirect_to company_admin_projects_url, :notice => "Project #{project.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update

    project_id = project.id # save for later
    result = false
    project.transaction do
      save_roles
      result = project.update_attributes(params[:project])
    end

    project = Project.find(project_id) # refresh the roles
    if result
      redirect_to company_admin_projects_url, :notice => "Project #{project.name} was updated successfully!"
    else
      render :new
    end
  end

  def destroy
    
  end


  def roles
    if params[:term]
      @roles = Role.find(:all,:conditions => ['company_id = ? AND name LIKE ?', company.id, "%#{params[:term]}%"]).map{|x| {:id => x.id, :name => x.name, :mode => :read}}
    else
      @roles = Role.all
    end

    respond_to do |format|
      format.json { render :json => @roles.to_json(:only =>[:id, :name, :mode]) }
    end
  end


  protected

  def save_roles
    project.roles = []
    RoleResource.where(:resource_id => project).where(:resource_type => 'Project').delete_all
    unless params["table_roles_field_id"].nil?
      i = 0
      while i < params["table_roles_field_id"].length do
        RoleResource.create(:role_id => params["table_roles_field_id"][i], :mode => params["table_roles_field_mode"][i], :resource_id => project.id, :resource_type => "Project")
        i += 1
      end
    end
  end
end
