class FavoriteMicropost < ActiveRecord::Migration
  def change
    rename_column :favorite_microposts, :tweet_id, :micropost_id
  end
end
