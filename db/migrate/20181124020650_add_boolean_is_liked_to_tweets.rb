class AddBooleanIsLikedToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :is_liked, :boolean, after: :tweet, null: false, default: false, comment: '該当ツイートがいいねされているかどうか true:いいねされている false:いいねされていない'
  end
end
