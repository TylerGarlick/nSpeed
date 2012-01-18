class Document < ActiveRecord::Base
  after_initialize :init

  belongs_to :document_type

  has_and_belongs_to_many :projects
  has_and_belongs_to_many :project_requirements

  has_many :document_assets
  has_many :submittal_documents
  has_many :documents, :through => :submittal_documents
  has_many :materials
  has_many :role_resources, :as => :resource
  has_many :roles, :through => :role_resources

  has_many :material_pos
  has_many :pos, :through => :material_pos

  def current_document
    document_assets.order("created_at DESC").first
  end

  private
  def init
    self.active = true if self.active.nil?
  end
end