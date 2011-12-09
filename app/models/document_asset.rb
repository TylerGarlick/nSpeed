class DocumentAsset < ActiveRecord::Base
  belongs_to :document
  belongs_to :submittal_status
  validates_presence_of :asset_url

  mount_uploader :asset_url, AssetUploader
  mount_uploader :customer_response_url, AssetUploader
end
