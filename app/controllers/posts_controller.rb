class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = current_user.posts.build
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    @post.update(count_like: 0)

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, success: 'Article updated successfully' }
      else
        flash.now[:danger] = 'The article has not been updated'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, success: 'Article updated successfully' }
      else
        flash.now[:danger] = 'The article has not been updated'
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :user_id, :count_like, :draft)
  end
end
