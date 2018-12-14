class UsersController < ApplicationController

  def index
    @users = User.all
    followings = UserFollowRelation.where(following_user_id: current_user.id)
    @followings_ids = followings.pluck(:followed_user_id)
  end

end
