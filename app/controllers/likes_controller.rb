class LikesController < ApplicationController

  def create
    like = Like.new(
      user_id: current_user.id,
      tweet_id: params[:tweet_id]
      )
    like.save
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
  end

end
