class MaterialTrackingsController < ApplicationController
  expose(:project)
  expose(:documents) {project.documents}

  expose(:material_trackings) {project.material_trackings}
  expose(:material_tracking)

  def index
  end

  def show
  end

  def new
  end

  def create
    project.material_trackings << material_tracking
    if project.save
      redirect_to project_material_trackings_url(project), :notice => "#{material_tracking.name} was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if material_tracking.update_attributes(params[:material_tracking])
      redirect_to project_material_trackings_url(project), :notice => "#{material_tracking.name} was created successfully!"
    else
      render :edit
    end
  end
end
