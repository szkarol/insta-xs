if Rails.env.test?
  CarrierWave.configure do |config|
    config.enable_processing = false
  end
end

# mock out calls to the cloud storage provider
# instead of switching to :file based storage in test env
Fog.mock!
Fog::Mock.delay = 0
service = Fog::Storage.new({
  provider: 'Google',
  google_storage_access_key_id:     Figaro.env.google_storage_access_key_id,
  google_storage_secret_access_key: Figaro.env.google_storage_secret_access_key
})
service.directories.create(key: Figaro.env.bucket_name)
