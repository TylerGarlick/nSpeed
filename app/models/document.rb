class Document < ActiveRecord::Base
  after_initialize :init

  has_and_belongs_to_many :projects
  has_many :document_assets

  private
  def init
    self.active = true if self.active.nil?
  end
end
