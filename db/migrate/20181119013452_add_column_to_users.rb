class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string, after: :id, null: false, default: '', comment: 'ユーザー名'
  end
end
