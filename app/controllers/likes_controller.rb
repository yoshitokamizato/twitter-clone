class LikesController < ApplicationController

  def create
    like = Like.new(
      user_id: current_user.id,
      tweet_id: params[:tweet_id],
      is_liked: params[:is_liked]
      )
    like.save
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
  end

end
