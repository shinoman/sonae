class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  before_action :index, only: [:micropost]
  
  def index
    if user_signed_in?
      @micropost = current_user.microposts.build
    end
      @feed_item = Micropost.all.order(created_at: :desc)
      @feed_items = @feed_item.page(params[:page]).per(10)
      respond_to do |format|
        format.html
        format.js
      end
      @hashtags = Hashtag.all
  end

  def show
  end
  
  def micropost
  end

  def tag
    @tag = Hashtag.find_by(name: params[:tag])
    @tag_micro = @tag. microposts.order(created_at: :desc)
    @tag_microposts = @tag_micro.page(params[:page]).per(10)
  end
  
end
