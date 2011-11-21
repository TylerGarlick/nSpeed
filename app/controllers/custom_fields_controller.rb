class CustomFieldsController < ApplicationController
  expose(:entity) {
    Kernel.const_get(params[:model].capitalize).find(params[:id])
  }

  expose(:custom_fields) {
    entity.custom_fields
  }

  def index
    render :json => {:success => true, :custom_fields => custom_fields, entity.class.name => entity }
  end

  def create
    render :json => {:success => true}
  end

  def update
    
  end

  def destroy
    
  end

end
