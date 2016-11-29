class FavoriteMicropostsController < ApplicationController
before_filter :sign_in_required
    def create
        @micropost = Micropost.find(params[:micropost_id])
        @favorite = current_user.favorite_microposts.build(micropost: @micropost)
        if @favorite.save
            redirect_to request.referrer || root_url, notice: "お気に入りに登録しました"
        else
            redirect_to request.referrer || root_url, alert: "このツイートはお気に入りに登録できません"
        end
    end
    
    def destroy
        @favorite = current_user.favorite_microposts.find_by!(micropost_id: params[:micropost_id])
        @favorite.destroy
        redirect_to request.referrer || root_url, notice: "お気に入りを解除しました"
    end
    
end