class PostImageUploader < BaseUploader
  def fog_directory
    ENV["AWS_S3_BUCKET_IMAGE"]
  end

  def asset_host
    ENV["CLOUDFRONT_HOST_IMAGE"]
  end

  def url
    File.join(asset_host, path)
  end
end
