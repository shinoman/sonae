CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJJEHRFBRRHXBMOEA',
      :aws_secret_access_key  => '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',
      :region                 => 'Tokyo', # Tokyo
      :path_style             => true,
  }

  config.fog_public     = true # public-read
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = 's3user-sonae.com'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/s3user-sonae.com'
    when 'staging'
      config.fog_directory = 'staging.s3user-sonae.com'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/staging.s3user-sonae.com'
    when 'development'
      config.fog_directory = 'dev.s3user-sonae.com'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.s3user-sonae.com'
    when 'test'
      config.fog_directory = 'test.s3user-sonae.com'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.s3user-sonae.com'
  end
end
