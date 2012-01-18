class MaterialList < ActiveRecord::Base
  belongs_to :project
  has_one :material
  validates_presence_of :project, :material
end
