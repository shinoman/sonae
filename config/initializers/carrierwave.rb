CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIEKPNLKZI6DWRJBA',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 's3user-sonae'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/s3user-sonae'

    when 'development'
      config.fog_directory = 's3user-sonae'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/s3user-sonae'

    when 'test'
      config.fog_directory = 's3user-sonae'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/s3user-sonae'
  end
end