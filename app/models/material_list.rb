class MaterialList < ActiveRecord::Base
  belongs_to :project
  belongs_to :document
  belongs_to :material

  #validates_presence_of :project_id, :material_id
  accepts_nested_attributes_for :material
end
