class Prerequisite < ActiveRecord::Base

  after_initialize :init

  belongs_to :project
  has_many :project_requirements

  private
  def init
    self.active = true if self.active.nil?
  end


end
