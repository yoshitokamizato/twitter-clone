class UserFollowRelationsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def index
    @followings = UserFollowRelation.eager_load(:following).where(following_user_id: current_user.id)
    @followers = UserFollowRelation.eager_load(:follower).where(followed_user_id: current_user.id)
    follow = UserFollowRelation.new
  end

  def create
    user = User.find(params[:id])
    follow = UserFollowRelation.new(follow_params)
    follow.following_user_id = current_user.id
    follow.followed_user_id = user.id
    if follow.save
      redirect_to users_path
    else
      render users_path
    end
  end

  def destroy
    relation = UserFollowRelation.where(following_user_id: current_user.id, followed_user_id: params[:id])
    if relation.destroy
      redirect_to users_path
    else
      render users_path
    end
  end

  private
    def follow_params
      params.require(:user_follow_relation).permit(:following_user_id, :followed_user_id)
    end
end
