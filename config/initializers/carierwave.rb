CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                                             # required
    :aws_access_key_id      => 'AKIAIT3A2EOQ3TVZS5PQ',                            # required
    :aws_secret_access_key  => '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',        # required
  }
  config.fog_directory  = 'nspeed-beta'                                           # required
  config.fog_public     = true
end