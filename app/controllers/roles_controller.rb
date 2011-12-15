class RolesController < AuthenticateUserController
  include Authorization
  before_filter :is_authorized?

  expose(:company) { current_user.company }
  expose(:roles) { company.roles.where(:active => true ) }
  expose(:role)

  def index
  end

  def new
  end

  def create
    role.active = true
    if role.save
      redirect_to company_admin_roles_url, :notice => "#{role.name} was created successfully!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    role.users = []
    unless params["users_id"].nil?
      params["users_id"].each do |id|
        role.users << User.find(id)
      end
    end
    if role.update_attributes(params[:role])
      redirect_to company_admin_roles_url, :notice => "#{role.name} was updated successfully!"
    else
      render :edit
    end
  end

  def remove_user(user_id)
    
  end

  def destroy
    role.active = false
    if role.save!
      message = "#{role.name} was removed successfully"
    else
      message = "There was a problem"
    end
    redirect_to company_admin_roles_url, :notice => message
  end

  protected
  def is_authorized?
    is_super_or_company_admin?(current_user.company)
  end

end
