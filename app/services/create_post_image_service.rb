class CreatePostImageService < ApplicationService
  def initialize(post, image)
    @post = post
    @image = image
  end

  def call
    string_io = StringIOForCarrierWave.new(@image.original_filename, @image.content_type, @image.read)
    @post.post_images.create!(file_path: string_io)
  rescue StandardError => e
    Rails.logger.error({ post: @post,
                         image: @image,
                         failed_to_create_post_image: "failed_to_create_post_image",
                         reason: e })
  end
end
