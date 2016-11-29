class HashtagsMicroposts < ActiveRecord::Migration
  def change
    create_table :hashtags_microposts do |t|
      t.integer :hashtag_id
      t.integer :micropost_id
    end
  end
end
