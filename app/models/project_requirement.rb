class ProjectRequirement < ActiveRecord::Base
  belongs_to :project
  belongs_to :prerequisite
  has_and_belongs_to_many :documents
  has_many :submittals

  validates_presence_of :name
end