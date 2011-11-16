class PeopleController < AuthenticateUserController
  expose(:company) {current_user.company}
  expose(:people) {
    if params[:query].nil? || params[:query].empty?
      company.people.active_people
    else
      company.people.active_people.where('first_name like ? or last_name like ? or email like ?', params[:query], params[:query], params[:query])
    end
  }
  expose(:person)

  def index
  end

  def show
    
  end

  def new

  end
  
  def create
    if person.save
      redirect_to people_url, :notice => "#{person.full_name} was created successfully"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if person.update_attributes(params[:person])
      redirect_to people_url, :notice => "#{person.full_name} was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    person.active = false
    if person.save
      message = "#{person.full_name} was removed successfully"
    else
      message = "There was a problem"
    end
    redirect_to people_url, :notice => message
  end

end
