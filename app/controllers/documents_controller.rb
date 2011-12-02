class DocumentsController < ApplicationController
  expose(:project)
  expose(:documents) {project.documents}
  expose(:document)

  def index
  end

  def show
  end

  def new
  end

  def create
    project.documents << document
    if project.save
      redirect_to project_documents_url, :notice => "Document was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if document.update_attributes(params[:document])
      redirect_to project_documents_url, :notice => "Document was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    document.destroy?
    redirect_to project_documents_url, :notice => "Document was deleted successfully!"
  end
end
