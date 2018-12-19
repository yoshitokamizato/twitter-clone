class UserFollowRelationsController < ApplicationController

  def index
    @followings = UserFollowRelation.eager_load(:following).where(following_user_id: current_user.id)
    @followings_ids = @followings.pluck(:followed_user_id)
    @followers = UserFollowRelation.eager_load(:follower).where(followed_user_id: current_user.id)
    follow = UserFollowRelation.new
  end

  def create
    follow = UserFollowRelation.new(following_user_id: current_user.id, followed_user_id: params[:user_id])
    if follow.save
      redirect_to users_path
    end
  end

  def destroy
    relation = UserFollowRelation.find_by(following_user_id: current_user.id, followed_user_id: params[:id])
    if relation.destroy
      redirect_to users_path
    end
  end

end
