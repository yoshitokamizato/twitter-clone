class FollowsController < ApplicationController

  def index
    @followings = Follow.all.where(following_user_id: current_user.id)
    @followers = Follow.all.where(followed_user_id: current_user.id)
  end
  
  def create
    following_user_id = current_user.id
    follow = Follow.new(follow_params)
    follow.save
  end
  
  def destroy
    @follow = Follow.where(
      following_user_id: current_user.id,
      followed_user_id: params[:followed_user_id])
    @follow.destroy
  end

  private
    def follow_params
      params.require(:follow).permit(:following_user_id, :followed_user_id)
    end
  
end
