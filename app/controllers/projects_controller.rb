class ProjectsController < AuthenticateUserController
  expose(:company) { current_user.company }
  expose(:projects) { accessible_projects }
  expose(:project)

  def index
  end

  def show
  end

  def update
    if project.update_attributes(params[:project])
      redirect_to projects_url, :notice => "#{project.name} was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
  end

  def accessible_projects
    if is_super_admin?
      project_list = Project.all
    elsif is_company_admin?
      project_list = company.projects
    else
      project_list = []
      company.projects.map { |p|
        if current_user.is_in_roles?(p.roles)
          project_list << p
        end
      }
    end
    project_list
  end
end
