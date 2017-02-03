class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :token
      t.string :refresh_token
      t.string :reddit_user_id
      t.string :username
      t.string :comment_karma
      t.timestamps
    end
  end
end
