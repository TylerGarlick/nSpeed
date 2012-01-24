class CompanyAdmin::UsersController < CompanyAdmin::CompanyAdminController
  expose(:company) { current_user.company }
  expose(:users) {
    get_users
  }
  expose(:user)

  def index

    respond_to do |format|
      format.html
      format.json { render :json => users.to_json(:only =>[:id, :username]) }
    end
  end

  def new
  end

  def create
    company.users << user
    if company.save
      redirect_to company_admin_users_url, notice: "User #{user.username} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if user.update_attributes(params[:user])
      redirect_to company_admin_users_url, notice: "User #{user.username} was update successfully!"
    else
      render :edit
    end
  end

  def destroy
    user.destroy
    redirect_to company_admin_users_url, notice: "User #{user.username} was deleted successfully!"
  end

  protected

  def get_users
    params[:term].blank? ? User.all : (is_super_admin? ? User.where('username LIKE ?', "%#{params[:term]}%") : User.where('company_id = ? AND username LIKE ?', company.id, "%#{params[:term]}%"))
  end
end