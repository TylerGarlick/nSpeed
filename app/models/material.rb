class Material < ActiveRecord::Base
  has_ancestry
  belongs_to :company

  validates_presence_of :name, :company_id

  scope :active_materials, where(:active => true)

  def predecessors
    children
  end

  def successor
    parent
  end
  def successor=(m)
    self.parent_id = m.id
  end

end
