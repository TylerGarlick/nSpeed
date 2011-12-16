class RoleResource < ActiveRecord::Base

  belongs_to :resource, :polymorphic => true
  belongs_to :role

  symbolize :mode, :in =>[:read, :write], :scopes => true
end
