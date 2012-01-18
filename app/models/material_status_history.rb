class MaterialStatusHistory < ActiveRecord::Base
  belongs_to :material_status
  belongs_to :material
end
