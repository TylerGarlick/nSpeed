class MaterialListsController < ApplicationController
  expose(:project)
  expose(:company) { project.company }
  expose(:material_types) { company.material_types.order(:name) }
  expose(:documents) { project.documents.where(document_type_id: DocumentType.find_all_by_name("Drawing")) }
  expose(:material_lists) { MaterialList.where(project_id: project) }
  expose(:material_list) {
    if params[:id].blank?
      MaterialList.new
    else
      MaterialList.find(params[:id])
    end
  }
  expose(:material_status) { MaterialStatus.first }

  def index
  end

  def new
  end

  def create
    if material_list.save
      redirect_to project_material_lists_url(project), notice: "Material #{material_list.material.material_type.name} was added successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if material_list.update_attributes[:material_list]
      redirect_to project_material_lists_url(project), notice: "Material #{material_list.material.material_type.name} was added successfully!"
    else
      render :edit
    end
  end

  def destroy
  end
end
