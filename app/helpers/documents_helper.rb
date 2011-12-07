module DocumentsHelper
  def get_file_from_url(document_asset)
    document_asset.asset_url.to_s.split('/').last
  end
end
