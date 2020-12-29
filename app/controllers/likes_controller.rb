class LikesController < ApplicationController
  #before_action :set_like, only: %i[create]

  def show
  	
  end

  def destroy
  	@like = Like.find(params[:post_id])
  	if @like.present?
    	@like.destroy
			#@post.update(count_like: (@post.count_like).to_int - 1)
			redirect_to post_path, notice: "dislike"
    else
			redirect_to post_path, notice: "вы не лайкнали этот пост"
    end
  end

  def create
  	@post = Post.find(params[:post_id])
  	@like = @post.likes.create(user_id_like: current_user.id)

  	#@like = Like.create(post_id: @post.id, user_id_like: current_user.id)
  	#@like.save
  	#@like = Дшлую @post.likes.build(like_params)
  	#@like.update(user_id_like: current_user.id)

  	#if @like.save
    #  redirect_to post_path(@post)
    #else
    #  render :new
    #end
  	#@post.update(count_like: (@post.count_like).to_int + 1)
  	redirect_to post_path(@post), success: 'like'

  end

  private

  #def set_like
  #	@post = Post.find(params[:post_id])
  #end

  def like_params
    params.require(:like).permit(:user_id_like)
  end
end
