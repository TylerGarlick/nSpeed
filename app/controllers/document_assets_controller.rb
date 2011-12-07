class DocumentAssetsController < ApplicationController
  expose(:project)
  expose(:document)
  expose(:submittal_statuses) {project.submittal_statuses}
  expose(:document_assets) { document.document_assets }
  expose(:document_asset)

  def new

  end

  def create
    document.document_assets << document_asset
    if document.save
      redirect_to project_document_path(project, document), :notice => "Document was saved successfully!"
    else
      redirect_to project_document_path(project, document), :notice => "There was an error saving the document, please try again"
    end
  end

  def edit
  end

  def update
    if document_asset.update_parameters[:document_asset]
      redirect_to project_document_path(project, document), :notice => "Document was saved successfully!"
    else
      redirect_to project_document_path(project, document), :notice => "There was an error saving the document, please try again"
    end
  end
end
