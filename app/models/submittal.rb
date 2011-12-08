class Submittal < ActiveRecord::Base
  belongs_to :project_requirement
  has_many :submittal_documents
  has_many :documents, :through => :submittal_documents, :foreign_key => "document_id"
end
