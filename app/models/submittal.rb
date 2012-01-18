class Submittal < ActiveRecord::Base
  belongs_to :project_requirement
  belongs_to :user
  has_many :submittal_documents
  has_many :documents, :through => :submittal_documents, :foreign_key => "document_id"

  mount_uploader :customer_document, AssetUploader
end
