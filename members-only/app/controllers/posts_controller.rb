class PostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  @post.save
  redirect_to root_path
  end



  private

    def post_params
      params.require(:post).permit(:title, :body)  
    end

    # before filter/action
    def signed_in_user
      unless signed_in?
        redirect_to signin_url
      end
    end

end
