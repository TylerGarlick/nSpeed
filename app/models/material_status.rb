class MaterialStatus < ActiveRecord::Base
  has_many :materials
  validates_presence_of :name
end
