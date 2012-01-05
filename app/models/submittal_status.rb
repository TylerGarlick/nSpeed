class SubmittalStatus < ActiveRecord::Base
  belongs_to :project
  validates_presence_of :name, :color
end
