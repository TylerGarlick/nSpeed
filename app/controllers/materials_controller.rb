class MaterialsController < ApplicationController
  expose(:project)
  expose(:company) { current_user.company }
  expose(:documents) { project.documents.where(document_type_id: DocumentType.find_by_name("Weld Map").id) }
  expose(:material_statuses) { MaterialStatus.all }
  expose(:material_lists) {
    MaterialList.where(project_id: project.id)
  }

  expose(:material_types) { company.material_types }
  expose(:pattern) {
    "%#{params[:query]}%"
  }
  expose(:material)
  expose(:document_types) { DocumentType.all }
  expose(:document) { Document.new }

  def index
  end

  def show
  end

  def new
  end

  def create
    material.material_status = MaterialStatus.find_by_name("Entered")
    if material.save
      redirect_to project_materials_url(project), :notice => "#{material.name} was created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if material.update_attributes(params[:material])
      redirect_to project_materials_url(project), :notice => "#{material.name} was updated successfully"
    else
      render :edit
    end
  end

  def destroy
    material.active = false
    if material.save
      message = "#{material.name} was removed successfully"
    else
      message = "There was a problem"
    end
    redirect_to project_materials_url(project), :notice => message
  end
end
