class AddSubmittalFieldsToDocumentAsset < ActiveRecord::Migration
  def change
    add_column :document_assets, :customer_response_url, :string
    add_column :document_assets, :customer_response_date, :datetime
    add_column :document_assets, :submittal_status_id, :integer
  end
end
