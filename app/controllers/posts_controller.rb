class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Post created successfully'
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
  end

  def show
    set_post
  end

  private

  def set_post
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
