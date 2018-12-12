class UsersController < ApplicationController

  def index
    @users = User.all
    followings = UserFollowRelation.where(followed_user_id: current_user.id)
    @followings_ids = followings.pluck(:id)
  end

end
