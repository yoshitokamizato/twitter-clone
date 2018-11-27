class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, { presence: true }

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :followings, class_name: 'Follow', foreign_key: 'followed_user_id', dependent: :destroy
  # has_many :followers, class_name: 'Follow', foreign_key: 'following_user_id', dependent: :destroy

end
