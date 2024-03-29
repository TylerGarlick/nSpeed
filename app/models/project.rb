class Project < ActiveRecord::Base
  belongs_to :company
  belongs_to :customer
  belongs_to :project_type

  has_many :project_requirements
  has_many :prerequisites
  has_many :submittal_statuses
  has_many :material_lists
  has_many :materials, :through => :material_lists


  has_and_belongs_to_many :documents

  has_many :role_resources, :as => :resource
  has_many :roles, :through => :role_resources

  validates_presence_of :name, :company_id, :customer_id, :project_type_id

  scope :all_active, where(:is_active => true)

  serialize :custom_fields, Hash

end