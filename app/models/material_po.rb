class MaterialPo < ActiveRecord::Base
  belongs_to :document
  belongs_to :material
end
