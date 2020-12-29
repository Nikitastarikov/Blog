class CommentsController < ApplicationController
  # before_action :set_post, only: %i[create destroy]

  def destroy
    @comment = Comment.find(params[:post_id])
    if @comment.present?
      @comment.destroy
      redirect_to post_path, success: 'comment delete'
    else
      redirect_to post_path, notice: 'comment not exists'
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.email = current_user.email

    if @comment.save
      redirect_to post_path(@post), success: 'comment created'
    else
      redirect_to post_path(@post), error: "comment don't created"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:email, :body)
  end
end
