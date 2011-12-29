class Material < ActiveRecord::Base

  belongs_to :project
  belongs_to :document
  has_many :material_invoices
  

  validates_presence_of :name, :project_id, :document_id
  validates_numericality_of :item_number, :quantity

  scope :active_materials, where(:active => true)

end