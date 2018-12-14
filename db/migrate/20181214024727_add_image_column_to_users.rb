class AddImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image, :text, after: :email, null: true, comment: 'プロフィール画像'
  end
end
