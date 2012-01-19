class MaterialDocument < ActiveRecord::Base
  belongs_to :material
  belongs_to :document
end
