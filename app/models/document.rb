class Document < ActiveRecord::Base
  after_initialize :init

  symbolize :document_type, :in => {:invoice => "Invoice", :weld_map => "Weld Map" , :project_document => "Project Document", :certification => "Certification"}, :scopes => true, :methods => true, :i18n => false

  has_and_belongs_to_many :projects
  has_and_belongs_to_many :project_requirements

  has_many :document_assets
  has_many :submittal_documents
  has_many :documents, :through => :submittal_documents
  has_many :materials
  has_many :role_resources, :as => :resource
  has_many :roles, :through => :role_resources

  def current_document
    document_assets.order("created_at DESC").first
  end

  private
  def init
    self.active = true if self.active.nil?
  end
end