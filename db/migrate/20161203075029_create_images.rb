class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.integer :micropost_id
      t.integer :blog_id
      t.integer :place_id
      t.integer :thread_contents_id
      t.string :name
      t.text :description
      t.string :image_url
      t.index :user_id
    	t.index :micropost_id
      t.index :blog_id
      t.index :place_id
    	t.index :thread_contents_id
      t.index :created_at
      t.timestamps null: false
    end
  end
end
