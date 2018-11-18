class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
    respond_to do |format|
      format.html # 通常のURLの場合、index.html.erb が返される
      format.json { render json: @tweets } # URLが.jsonの場合、@tweets.to_json が返される
    end
  end

end
