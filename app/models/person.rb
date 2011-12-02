class Person < ActiveRecord::Base
  belongs_to :company
  has_and_belongs_to_many :projects

  validates_presence_of :first_name, :last_name, :company_id

  scope :active_people, where(:active => true)
  scope :not_in_project, lambda { |project| {:conditions => ["company_id = ? And id not in (?)", project.company.id, project.people.select(&:id).join(',')]} }

  def full_name
    "#{last_name}, #{first_name}"
  end
end