class CompanyAdmin::ProjectPeopleController < ApplicationController
  expose(:company) { current_user.company }
  expose(:project)

  expose(:all_people) { Person.not_in_project(project) }
  expose(:people) { project.people }
  expose(:person)

  def index
  end

  def save
    params[:ids].each do |id|
      unless project.people.exists?(id)
        project.people << Person.find(id)
      end
    end
    project.save

    redirect_to company_admin_project_project_people_url, :notice => "People were added successfully to the project."
  end

  def remove
    removed_person = project.people.find(params[:id])
    project.people.destroy(params[:id])
    project.save
    redirect_to company_admin_project_project_people_url, :notice => "#{removed_person.first_name} #{removed_person.last_name} was removed successfully."
  end
end
