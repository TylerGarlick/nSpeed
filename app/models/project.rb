class Project < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :name, :company_id

  scope :all_active, where(:is_active => true)

  serialize :custom_fields, Hash
end