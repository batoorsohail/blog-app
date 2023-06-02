class CommentsController < ApplicationController
  def index
    @posts = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    
    if @posts
      @comments = @posts.comments
      respond_to do |format|
        format.html
        format.json { render json: @comments }
      end
    else
      flash[:alert] = "Post not found"
      redirect_to user_posts_path(@user)
    end
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])

    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_post_path(@post.author, @post), notice: 'Comment created' }
        format.json { render json: @comment, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, alert: 'Comment not created!' }
        format.json { render json: @comment.errors, status: :unprocessable_entry }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
