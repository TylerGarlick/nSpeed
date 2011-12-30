class DocumentsController < ApplicationController
  respond_to :html, :json

  expose(:project)
  expose(:project_requirements) {project.project_requirements}
  expose(:submittal_statuses) {project.submittal_statuses}
  expose(:documents) {
    if params[:project_requirement_id].nil? || params[:project_requirement_id].empty?
      project.documents
    else
      ProjectRequirement.find(params[:project_requirement_id]).documents
    end
  }
  expose(:document)


  def index
  end

  def by_requirement
    respond_with ProjectRequirement.find(params[:project_requirement_id]).documents.order(:name)
  end

  def show
  end

  def new
  end

  def create
    project.documents << document
    if project.save
      redirect_to project_documents_url(project), :notice => "Document was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    params[:document][:project_requirement_ids] ||= []
    if document.update_attributes(params[:document])
      redirect_to project_documents_url(project), :notice => "Document was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    document.destroy?
    redirect_to project_documents_url(project), :notice => "Document was deleted successfully!"
  end
end
