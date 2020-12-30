class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @posts = Post.where(user_id: current_user.id)
    @my_mmr = 0
    @posts.each do |post|
      @my_mmr += post.likes.count
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
