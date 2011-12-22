class MaterialInvoice < ActiveRecord::Base
  belongs_to :material
  belongs_to :user

  validates_presence_of :document_id, :line_item, :quantity_ordered, :quantity_received
  validates_numericality_of :quantity_ordered, :quantity_received

  scope :ordered_invoices, order(:line_item)
end