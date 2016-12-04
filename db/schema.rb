# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161203130305) do

  create_table 'favorite_microposts', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'micropost_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'favorite_microposts', ['created_at'], name: 'index_favorite_microposts_on_created_at'
  add_index 'favorite_microposts', ['micropost_id'], name: 'index_favorite_microposts_on_micropost_id'
  add_index 'favorite_microposts', ['user_id'], name: 'index_favorite_microposts_on_user_id'

  create_table 'hashtags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'hashtags_microposts', force: :cascade do |t|
    t.integer 'hashtag_id'
    t.integer 'micropost_id'
  end

  create_table 'images', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'micropost_id'
    t.integer 'blog_id'
    t.integer 'place_id'
    t.integer 'thread_contents_id'
    t.string 'name'
    t.text 'description'
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'images', ['blog_id'], name: 'index_images_on_blog_id'
  add_index 'images', ['created_at'], name: 'index_images_on_created_at'
  add_index 'images', ['micropost_id'], name: 'index_images_on_micropost_id'
  add_index 'images', ['place_id'], name: 'index_images_on_place_id'
  add_index 'images', ['thread_contents_id'], name: 'index_images_on_thread_contents_id'
  add_index 'images', ['user_id'], name: 'index_images_on_user_id'

  create_table 'microposts', force: :cascade do |t|
    t.integer 'user_id'
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'microposts', ['user_id'], name: 'index_microposts_on_user_id'

  create_table 'places', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'address'
    t.string 'type'
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_index 'relationships', ['followed_id'], name: 'index_relationships_on_followed_id'
  add_index 'relationships', ['follower_id', 'followed_id'], name: 'index_relationships_on_follower_id_and_followed_id', unique: true
  add_index 'relationships', ['follower_id'], name: 'index_relationships_on_follower_id'

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.string 'provider'
    t.string 'uid'
    t.string 'username', default: 'anonymous'
    t.string 'name'
    t.string 'sexes'
    t.string 'martial_status'
    t.string 'postal_code'
    t.string 'latitude'
    t.string 'longitude'
    t.string 'bank'
    t.string 'number_type'
    t.string 'account_number'
    t.string 'admin'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'address'
    t.string 'image'
  end

  add_index 'users', ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
  add_index 'users', ['email'], name: 'index_users_on_email', unique: true
  add_index 'users', ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  add_index 'users', ['unlock_token'], name: 'index_users_on_unlock_token', unique: true

end
