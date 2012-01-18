class Material < ActiveRecord::Base

  belongs_to :material_type
  belongs_to :project
  belongs_to :document
  belongs_to :material_status
  belongs_to :material_list

  has_many :material_invoices
  has_many :material_pos
  has_many :pos, :through => :material_pos
  has_many :material_status_histories

  validates_presence_of :name, :project_id, :document_id
  validates_numericality_of :item_number, :quantity

  mount_uploader :invoice_url, AssetUploader

  scope :active_materials, where(:active => true)

  def current_status
    material_status_histories.order("created_at ASC").first
  end

end