class MaterialStatus < ActiveRecord::Base
  has_many :materials
  has_many :material_status_histories

  validates_presence_of :name


end
