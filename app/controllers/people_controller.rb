class PeopleController < AuthenticateUserController

  expose(:project)
  expose(:company) {project.company}
  expose(:people) {
    if params[:query].nil? || params[:query].empty?
      project.people
    else
      pattern = "%#{params[:query]}%"
      project.people.where('first_name like ? or last_name like ? or email like ?', pattern, pattern, pattern)
    end
  }
  expose(:person)
  expose(:pattern) {
    params[:query]
  }


  def index
  end

  def show
  end


end
