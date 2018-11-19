class TweetsController < ApplicationController

  def index
    tweets = Tweet.all.where(user_id: current_user.id)
    respond_to do |format|
      format.html # 通常のURLの場合、index.html.erb が返される
      format.json { render json: tweets } # URLが.jsonの場合、tweets.to_json が返される
    end
  end

  # def new
  # end

  def create
    tweet = Tweet.new(
      user_id: current_user.id,
      tweet: params[:tweet]
      )
    tweet.save
  end

  # private
  #   def create_params
  #     params.require(:tweet).permit(:user_id, :tweet)
  #   end

end
