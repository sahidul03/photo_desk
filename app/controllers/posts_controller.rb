class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.preload(:post_images).published.latest_top.page(params[:page])
  end

  def create
    @post = CreatePostService.new( post_params, post_images).call
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :title, :user_id)
  end

  def post_images
    params[:post][:images]
  end
end
