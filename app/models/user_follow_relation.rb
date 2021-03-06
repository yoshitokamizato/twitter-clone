class UserFollowRelation < ApplicationRecord

  belongs_to :following, class_name: 'User', foreign_key: 'followed_user_id' # 自分がフォローしているユーザー（following_user_idが自分の時のfollowed_user）
  belongs_to :follower, class_name: 'User', foreign_key: 'following_user_id' # 自分をフォローしているユーザー（followed_user_idが自分の時のfollowing_user）

  def self.make_user_id_list(current_user_id)
    followings = UserFollowRelation.where(following_user_id: current_user_id)
    followings_ids = followings.pluck(:followed_user_id)
    followings_ids.push(current_user_id)
  end

end
