class MaterialsController < ApplicationController
  expose(:project)
  expose(:company) { current_user.company }
  expose(:documents) { project.documents.where(document_type_id: DocumentType.find_by_name("Weld Map").id) }
  expose(:materials) {
    if params[:query].nil? || params[:query].empty?
      project.materials.active_materials
    else
      project.materials.active_materials.where('name like ? or heat_number like ?', pattern, pattern)
    end
  }
  expose(:pattern) {
    "%#{params[:query]}%"
  }
  expose(:material)

  def index
  end

  def show
  end

  def new
  end

  def create
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
      redirect_to  project_materials_url(project), :notice => "#{material.name} was updated successfully"
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
    redirect_to  project_materials_url(project), :notice => message
  end
end
