class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy like dislike]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = current_user.posts.build
  end

  def like
  #  if current_user.likes.exists?(post_id: @post.id)
  #    redirect_to post_path(@post), notice: "вы уже лайкнули этот пост"
  #  else

  #    @like_post = current_user.likes.build
  #    @like_post.post_id = @post.id
  #    @like_post.save
  #    @temp = (@post.count_like).to_int 
  #    @temp += 1
  #    if @like_post.save 
  #      @post.update(count_like: @temp)
  #      redirect_to post_path(@post), notice: "like"
  #    end

  #  end
  end

  def dislike
  #  if current_user.likes.exists?(post_id: @post.id)
  #    @like_post = current_user.likes.find_by_post_id(@post.id)
  #    @like_post.destroy
  #    @temp = (@post.count_like.to_int
  #    @temp -= 1
  #    @post.update(count_like: @temp)
  #    redirect_to post_path(@post), notice: "dislike"

  #  else
  #    redirect_to post_path(@post), notice: "вы не лайкали этот пост"
  #  end
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    @post.update(count_like: 0)

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, success: 'Статья успешно обновлена' }
        # format.json { render :show, status: :created, location: @post }
      else
        flash.now[:danger] = 'Статья не обновлена'
        format.html { render :new }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, success: 'Статья успешно обновлена' }
        # format.json { render :show, status: :ok, location: @post }
      else
        flash.now[:danger] = 'Статья не обновлена'
        format.html { render :edit }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :user_id, :count_like)
  end
end
