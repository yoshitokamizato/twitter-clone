class CreateUserFollowRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_follow_relations do |t|
      t.integer :following_user_id, null: false, default: 0, comment: 'フォローしたユーザーのID'
      t.integer :followed_user_id, null: false, default: 0, comment: 'フォローされたユーザーのID'

      t.timestamps
    end
  end
end
