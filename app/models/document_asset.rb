class DocumentAsset < ActiveRecord::Base
  belongs_to :document
  validates_presence_of :asset_url

  mount_uploader :asset_url, AssetUploader
end
