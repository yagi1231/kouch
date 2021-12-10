unless Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIA6L6KZU32Y2MADZMB',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
      }
  
      config.fog_directory  = 'kouch'
      config.cache_storage = :fog
    end
  end