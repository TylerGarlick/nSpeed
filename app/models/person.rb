class Person < ActiveRecord::Base
  belongs_to :company

  validates_presence_of :first_name, :last_name, :company_id

  scope :active_people, where(:active => true)

  def full_name
    "#{first_name} #{last_name}"
  end
end