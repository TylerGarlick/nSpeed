class MaterialList < ActiveRecord::Base
  belongs_to :project
  belongs_to :document
  belongs_to :material

  validates_presence_of :project, :material
  accepts_nested_attributes_for :material
end
