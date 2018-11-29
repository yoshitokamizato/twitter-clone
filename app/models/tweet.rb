class Tweet < ApplicationRecord

  validates :tweet, { presence: true }

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

end
