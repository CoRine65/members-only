class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :create ]


  def index
    @posts = Post.all.includes(:user)
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_param)
    if @post.save
      redirect_to posts_path, notice: "Post created!"
    else
      @posts = Post.all.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def post_param
    params.require(:post).permit(:content)
  end
end
