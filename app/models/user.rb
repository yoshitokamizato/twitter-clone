class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, { presence: true }

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet

  has_many :followings, class_name: 'UserFollowRelation', foreign_key: :followed_user_id, dependent: :destroy
  has_many :followers, class_name: 'UserFollowRelation', foreign_key: :following_user_id, dependent: :destroy

  # has_many :active_follow_relations, class_name: 'FollowRelation', foreign_key: :following_user_id, dependent: :destroy
  # has_many :followings, class_name: 'User', through: :active_follow_relations, source: :following
  # has_many :passive_follow_relations, class_name: 'FollowRelation', foreign_key: :followed_user_id, dependent: :destroy
  # has_many :followers, class_name: 'User', through: :passive_follow_relations, source: :follower

  # # 回答者
  # has_many :active_follows, class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy
  # # 自分がフォローしている（active_follows）フォローされたユーザー（followed_user）
  # has_many :following_users, through: :active_follows, source: :followed_user

  # has_many :passive_follows, class_name: 'Follow', foreign_key: :followed_id, dependent: :destroy
  # # 自分がフォローされた（passive_follows）フォローしたユーザー(follower)
  # has_many :followers, through: :passive_follows, source: :follower


  # # 似た質問
  # # フォローしているユーザー
  # has_many :following_user_relations, class_name: 'UserFollowRelation', foreign_key: 'from_user_id', dependent: :destroy
  # has_many :following_users, through: :following_user_relations, class_name: 'User', source: :to_user

  # # フォローされているユーザー
  # has_many :followed_user_relations, class_name: 'UserFollowRelation', foreign_key: 'to_user_id', dependent: :destroy
  # has_many :followed_users, through: :followed_user_relations, class_name: 'User', source: :from_user
end
