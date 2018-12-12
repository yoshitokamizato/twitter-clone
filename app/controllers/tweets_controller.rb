class TweetsController < ApplicationController

  def index
    followings = UserFollowRelation.where(followed_user_id: current_user.id)
    followings_ids = followings.pluck(:id)
    user_ids = followings_ids.push(current_user.id)
    @tweets = Tweet.where(user_id: user_ids).order('created_at DESC')
    @tweet = Tweet.new
    like = Like.new
  end

  def show

  end

  def create
    followings = UserFollowRelation.where(followed_user_id: current_user.id)
    followings_ids = followings.pluck(:id)
    user_ids = followings_ids.push(current_user.id)
    @tweets = Tweet.where(user_id: user_ids).order('created_at DESC')
    @tweet = Tweet.new(tweet: tweet_params[:tweet], user_id: current_user.id)
    if @tweet.save
      redirect_to tweets_path
    else
      render template: 'tweets/index'
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.destroy
      redirect_to tweets_path
    else
      render tweets_path
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:tweet)
    end

end
