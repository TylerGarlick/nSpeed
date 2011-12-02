class ProjectRequirement < ActiveRecord::Base
  belongs_to :project
  belongs_to :prerequisite

  validates_presence_of :name
end