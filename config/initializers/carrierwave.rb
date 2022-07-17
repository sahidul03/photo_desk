CarrierWave.configure do |config|
  case Rails.env
  when "development", "test"
    config.fog_credentials = {
      provider: "AWS",
      region: ENV["AWS_REGION"],
      aws_access_key_id: "minioadmin",
      aws_secret_access_key: "minioadmin",
      path_style: true,
      host: "minio",
      endpoint: "http://minio:9000"
    }
  when "production"
    config.fog_credentials = {
      provider: "AWS",
      region: ENV["AWS_REGION"],
      use_iam_profile: true
    }
    config.fog_public = false
  end
end
