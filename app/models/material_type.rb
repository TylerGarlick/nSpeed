class MaterialType < ActiveRecord::Base
  belongs_to :company
  has_many :materials

  validates_presence_of :name
end
