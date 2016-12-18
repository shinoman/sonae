class MicropostsController < ApplicationController
    before_action :sign_in_required, only: [:create]
    
    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            str = @micropost.content
            str.scan(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/).map(&:strip).each do |hash|
                hashtag = view_context.full_to_half(hash)
                hashtagname = hashtag.downcase
                exittag = Hashtag.find_by(name: hashtagname)
                if hashtag != ''
                    if exittag == nil
                        hashtag = Hashtag.new
                        hashtag.name = hashtagname
                        @micropost.hashtags << hashtag
                        hashtag.save
                    else
                        exitname = @micropost.hashtags.find_by(name: hashtagname)
                        if exitname == nil
                            @micropost.hashtags << exittag
                        end
                    end
                end
            end
            flash[:success] = 'Micropost crated!'
            redirect_to request.referrer || root_url
        else
            @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page])
            @user = current_user
            render 'pages/index'
        end
    end
    
    def destroy
        @micropost = current_user.microposts.find_by(id: params[:id])
        return redirect_to root_url if @micropost.nil?
        @micropost.destroy
        flash[:success] = 'Micropost deleted'
        redirect_to request.referrer || root_url
    end

    
    private
    def micropost_params
        params.require(:micropost).permit(:content)
    end
end
