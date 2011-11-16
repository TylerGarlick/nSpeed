class MaterialsController < ApplicationController

  expose(:company) {current_user.company}
  expose(:materials) {
    if params[:query].nil? || params[:query].empty?
      company.material.active_materials
    else
      pattern = "%#{params[:query]}%"
      company.material.active_materials.where('name like ? or heat_number like ? or n_number like ?', pattern, pattern, pattern)
    end
  }
  expose(:pattern) {
    params[:query]
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
      redirect_to materials_url, :notice => "#{material.name} was created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if material.update_attributes(params[:material])
      redirect_to materials_url, :notice => "#{material.name} was updated successfully"
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
    redirect_to materials_url, :notice => message
  end
end
