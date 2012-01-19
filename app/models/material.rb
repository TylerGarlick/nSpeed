class Material < ActiveRecord::Base

  belongs_to :material_type
  belongs_to :project
  belongs_to :material_status
  belongs_to :material_list
  belongs_to :company
  has_one :material_list

  has_many :material_documents
  has_many :documents, :through => :material_documents

  has_many :material_status_histories

  validates_presence_of :project_id
  validates_numericality_of :item_number, :quantity

  mount_uploader :invoice_url, AssetUploader


  def current_status
    material_status_histories.order("created_at ASC").first
  end

end