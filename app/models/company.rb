class Company < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :users
  has_many :people
  has_many :projects
  has_many :material
  has_many :project_types
  has_many :customers


end