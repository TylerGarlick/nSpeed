class Customer < ActiveRecord::Base
  belongs_to :company
  has_many :projects
  validates_presence_of :name
end
