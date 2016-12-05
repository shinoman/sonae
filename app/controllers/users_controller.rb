class UsersController < ApplicationController
  before_action :set_user
  before_action :microposts_post, :relation_micropost_post, :tag, :followers, :followings, :favorite_microposts, :favorited_post, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def followings
    @followings = @user.following_users
    @following = @followings.page(params[:page]).per(10)
  end

  def followers
    @followers = @user.follower_users
    @follower = @followers.page(params[:page]).per(10)
  end

  def microposts_post
    @micro = @user.microposts.order(created_at: :desc)
    @microposts = @micro.page(params[:page]).per(10)
  end

  def relation_micropost_post
    @relation_micro = @user.feed_items.includes(:user).order(created_at: :desc)
    @relation_microposts = @relation_micro.page(params[:page]).per(10)
    @relation_user_post = 0
    @user.relation_users.each do |f|
      if f.microposts.count != nil
        count = f.microposts.count
        @relation_user_post += count
      end
    end
  end

  def favorite_microposts
  end

  def favorited_post
    @favo_micro = @user.favorite_microposts
    @favo_microposts = @favo_micro.page(params[:page]).per(10)
  end

  private

  def set_user
    @user = User.find(params[:id])
    @micropost = current_user.microposts.build if user_signed_in?
  end

  def tag
    @hashtags = Hashtag.all
  end

end