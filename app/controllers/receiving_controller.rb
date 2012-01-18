class ReceivingController < ApplicationController
  expose(:company) { current_user.company }
  expose(:material_statuses) { MaterialStatus.all }
  expose(:materials) {
    if params[:material_status_id].blank?
      material_status = MaterialStatus.first
    else
      material_status = MaterialStatus.find(params[:material_status_id])
    end
    material_status.materials.where(:project_id => company.projects)
  }
  expose(:material) { Material.find(params[:id]) }

  def index
  end

  def edit
  end

  def update
    if material.update_attributes(params[:material]) && change_material_state(material)
      redirect_to receiving_index_url, :notice => "Material #{material.name} was updated successfully!"
    else
      render :edit
    end
  end

  private
  def change_material_state(material)
    if material.material_status == MaterialStatus.find_by_name("Entered") && !material.quantity_ordered.nil?
      material.material_status = MaterialStatus.find_by_name("Ordered")
      material.ordered_user_id = current_user.id
      material.ordered_date = DateTime.now
    elsif material.material_status == MaterialStatus.find_by_name("Ordered") && !material.quantity_received.nil?
      material.material_status = MaterialStatus.find_by_name("Received")
      material.received_user_id = current_user.id
      material.received_date = DateTime.now
    end
    material.save
  end
end
