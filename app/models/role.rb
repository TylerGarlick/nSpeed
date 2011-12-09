class Role < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :users
  

  validates_presence_of :name, :company_id
  validates_uniqueness_of :name, :scope => [:company_id, :active], :if => Proc.new { |role| role.active }, :message => "name must be unique"

  scope :all_active, where(:is_active => true)

end
