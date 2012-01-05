class Material < ActiveRecord::Base

  belongs_to :project
  belongs_to :document
  belongs_to :material_status
  has_many :material_invoices

  validates_presence_of :name, :project_id, :document_id
  validates_numericality_of :item_number, :quantity

  mount_uploader :invoice_url, AssetUploader

  scope :active_materials, where(:active => true)

end