class Role < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :users

  has_many :role_resources, :dependent => :destroy
  has_many :projects, :through => :role_resources, :source => :resource, :source_type => "Project"

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:company_id, :active], :if => Proc.new { |role| role.active }, :message => "name must be unique"

  scope :all_active, where(:is_active => true)

  def user_in_role(user)
    users.include?(user)
  end
end