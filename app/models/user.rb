class User < ApplicationRecord

  mount_uploader :image, ImageUploader
  
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

end
