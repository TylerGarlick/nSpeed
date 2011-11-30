class ProjectsController < AuthenticateUserController
  expose(:company) { current_user.company }
  expose(:projects) { company.projects }
  expose(:project)

  def index
  end

  def show
  end

  def edit
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

end
