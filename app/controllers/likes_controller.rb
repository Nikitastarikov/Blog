class LikesController < ApplicationController
  before_action :set_like, only: %i[create destroy]

  def destroy
    @like = @post.likes.find(params[:id])
    if @like.present?
      @like.destroy
      redirect_to post_path(@post), notice: 'dislike'
    else
      redirect_to post_path(@post), notice: 'вы не лайкнали этот пост'
    end
  end

  def create
    @like = @post.likes.new(user_id: current_user.id)
    @post.update(count_like: @post.likes.count)
    if @like.save
      redirect_to post_path(@post), success: 'like'
    else
      redirect_to post_path(@post), success: 'не получилось'
    end
  end

  private

  def set_like
    @post = Post.find(params[:post_id])
    @post.update(count_like: @post.likes.count)
    @post.save
  end

  def like_params
    params.require(:like).permit(:user_id)
  end
end
