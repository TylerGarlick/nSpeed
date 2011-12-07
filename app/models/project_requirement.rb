class ProjectRequirement < ActiveRecord::Base
  belongs_to :project
  belongs_to :prerequisite
  has_and_belongs_to_many :documents

  validates_presence_of :name
end