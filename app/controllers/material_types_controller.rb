class MaterialTypesController < ApplicationController
  expose(:company) {current_user.company}
  expose(:project)
  expose(:material_types) {MaterialType.where(:company_id => company)}
  expose(:material_type)


  def index
  end

  def show
  end

  def new
  end

  def create
    if material_type.save
      redirect_to project_material_types_url(project), notice: "Material Type #{material_type.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if material_type.update_attribues(params[:material_type])
      redirect_to project_material_types_url(project), notice: "Material Type #{material_type.name} was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    material_type.destroy
    redirect_to project_material_types_url(project), notice: "Material Type #{material_type.name} was deleted successfully!"
  end
end
