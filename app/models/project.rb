class Project < ActiveRecord::Base
  belongs_to :company
  belongs_to :customer
  has_many :project_requirements

  validates_presence_of :name, :company_id, :customer_id, :project_type_id

  scope :all_active, where(:is_active => true)

  serialize :custom_fields, Hash

end