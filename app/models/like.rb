class Like < ApplicationRecord

  belongs_to :user, foreign_key: 'user_id'
  belongs_to :tweet, foreign_key: 'tweet_id'
  
end
