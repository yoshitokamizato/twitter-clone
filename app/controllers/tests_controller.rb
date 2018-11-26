class TestsController < ApplicationController
  def index
    @tweets = Tweet.all.where(user_id: current_user.id)
    # @tweet_ids = Like.pluck(:tweet_id)
    @array = [{tweet_id: 1}, {tweet_id: 2}, {tweet_id: 3}]
    @hash = {a: 1, b: 2, c: 3}
  end
end
