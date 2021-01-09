class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @posts = Post.where(user_id: @user.id)
    @my_mmr = 0
    @posts.each do |post|
      @my_mmr += post.likes.count
    end
  end

  def moderator
    return unless user_signed_in? && current_user.rank == 2

    case @user.rank
    when 0
      @user.update(rank: 1)
      @user.rank = 1
      @user.save
      redirect_to profile_path(@user.id), success: 'success'
    when 1
      redirect_to profile_path(@user.id), error: 'error'
    end
  end

  def del_moderator
    return unless user_signed_in? && current_user.rank == 2

    case @user.rank
    when 1
      @user.update(rank: 0)
      @user.rank = 0
      @user.save
      redirect_to profile_path(@user.id), success: 'success'
    when 0
      redirect_to profile_path(@user.id), error: 'error'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
