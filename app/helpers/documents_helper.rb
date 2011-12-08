module DocumentsHelper
  def get_file_from_url(url)
    url.to_s.split('/').last
  end
end
