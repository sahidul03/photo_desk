class CreatePostService < ApplicationService
  def initialize(post_params, images = [])
    @post_params = post_params
    @images = images
  end

  def call
    if !@post_params[:body].present? && !(@images.is_a?(Array) && @images.any?)
      raise ActionController::BadRequest, "Post body can't be blank!"
    end

    post = Post.create!(@post_params)
    if @images.is_a?(Array) && @images.any?
      @images.each do |image|
        CreatePostImageService.new(post, image).call
      end
    end
    post
  rescue StandardError => e
    Rails.logger.error({ post_params: @post_params,
                         images: @images,
                         failed_to_create_post: "failed_to_create_post",
                         reason: e })
    raise e
  end
end
