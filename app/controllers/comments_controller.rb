class CommentsController < ApplicationController
  # before_action :set_post, only: %i[create destroy]

  def destroy
    if @comment
      @comment.destroy
      redirect_to root_path, success: 'comment delete'
    end
    redirect_to root_path
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.update(email: current_user.email)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:email, :body)
  end
end
