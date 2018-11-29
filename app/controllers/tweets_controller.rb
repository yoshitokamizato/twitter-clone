class TweetsController < ApplicationController

  def index
    following_user_ids = Follow.all.where(following_user_id: current_user.id).map(&:followed_user_id) # フォローしているユーザーのID(配列)
    @tweets = Tweet.all.where(user_id: current_user.id).or(Tweet.all.where(user_id: following_user_ids)).order('created_at DESC') # 自分のツイートとフォローしているユーザーのツイート
    # respond_to do |format|
    #   format.html # 通常のURLの場合、index.html.erb が返される
    #   format.json { render json: @tweets.to_json(:include => {
    #     :user => {:only => :user_name},
    #     :likes => {:only => :tweet_id}
    #   }) } # URLが.jsonの場合、tweets.to_json が返される
    # end
    @tweet = Tweet.new()
    like = Like.new()
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to(authenticated_root_path)
    else
      flash[:notice] = '投稿失敗'
      render(authenticated_root_path)
    end
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    if tweet.destroy
      redirect_to(authenticated_root_path)
    else
      flash[:notice] = '投稿削除失敗'
      render(authenticated_root_path)
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:user_id, :tweet)
    end

end
