class LikesController < ApplicationController

  def index
    @user = User.find(current_user.id)
  end

  def create
    like = Like.new(
      tweet_id: params[:tweet_id],
      user_id: current_user.id
    )
    if like.save
      redirect_to(authenticated_root_path)
    else
      flash[:alert] = 'いいね失敗'
      render(authenticated_root_path)
    end
  end

  def destroy
    like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    if like.destroy
      redirect_to(authenticated_root_path)
    else
      flash[:alert] = 'いいね削除失敗'
      render(authenticated_root_path)
    end
  end

  private
    def like_params
      params.require(:like).permit(:tweet_id, :user_id)
    end

end
