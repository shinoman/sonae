class RelationshipsController < ApplicationController
    before_action :user_signed_in?
    
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
        @follower_count = @user.follower_users.count
    end
    
    def destroy
        @user = current_user.following_relationships.find(params[:id]).followed
        current_user.unfollow(@user)
        @follower_count = @user.follower_users.count
    end
end
