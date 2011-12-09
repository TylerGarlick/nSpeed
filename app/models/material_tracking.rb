class MaterialTracking < ActiveRecord::Base
  belongs_to :project
  has_many :material_tracking_items
end
