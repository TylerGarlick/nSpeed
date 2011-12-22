class Project < ActiveRecord::Base
  belongs_to :company
  belongs_to :customer
  has_many :project_requirements
  has_many :prerequisites
  has_many :submittal_statuses
  has_many :materials

  has_and_belongs_to_many :people
  has_and_belongs_to_many :documents

  validates_presence_of :name, :company_id, :customer_id, :project_type_id

  scope :all_active, where(:is_active => true)

  serialize :custom_fields, Hash

end