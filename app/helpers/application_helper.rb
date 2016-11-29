module ApplicationHelper
    def profile_img(user)
        if user.provider == 'facebook'
            img_url = "https://graph.facebook.com/#{user.uid}/picture?width=320&height=320"
        elsif user.provider == 'twitter'
            img_url = "http://furyu.nazo.cc/twicon/#{user.uid}"
        else
            gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
            img_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        end
        image_tag(img_url, alt: user.name)
    end

    require "uri"
    def text_url_to_link text
        URI.extract(text, ['http','https']).uniq.each do |url|
            sub_text = ""
            sub_text << "<a href=" << url << " target=\" _blank\" data-confirm=\"外部サイトに移動します。よろしいですか？\" >" << url << "</a>"
            text.gsub!(url, sub_text)
        end
        text.scan(/[#＃][Ａ-Ｚａ-ｚA-Za-z一-鿆0-9０-９ぁ-ヶｦ-ﾟー]+/).map(&:strip).each do |hash|
           text.gsub!(hash, "")
        end
        return text
    end
    
    def full_to_half(str)
      str.tr('０-９ａ-ｚＡ-Ｚ　＃', '0-9a-zA-Z #')
    end
    
end
