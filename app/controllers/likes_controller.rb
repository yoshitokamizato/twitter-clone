class LikesController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
  end

  def create
    like = Like.new(tweet_id: params[:tweet_id], user_id: current_user.id)
    if like.save
      redirect_to tweets_path
    end
  end

  def destroy
    like = Like.find_by(tweet_id: params[:id], user_id: current_user.id)
    if like.destroy
      redirect_to tweets_path
    end
  end

end
