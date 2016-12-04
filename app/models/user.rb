class User < ActiveRecord::Base
    mount_uploader :image, UserImageUploader
    has_many :microposts
    has_many :following_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
    has_many :following_users, through: :following_relationships, source: :followed
    has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
    has_many :follower_users, through: :follower_relationships, source: :follower
    has_many :favorite_microposts, dependent: :destroy
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :lockable, :timeoutable, :omniauthable, :omniauth_providers => [:twitter, :facebook]

    def self.from_omniauth(auth)
        find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
            if auth['provider'] == 'twitter'
                user.username = auth['info']['nickname']
            else
                user.username = auth['info']['name']
            end
        end
    end

    def follow(other_user)
        following_relationships.find_or_create_by(followed_id: other_user.id)
    end

    def unfollow(other_user)
        following_relationship = following_relationships.find_by(followed_id: other_user.id)
        following_relationship.destroy if following_relationship
    end

    def following?(other_user)
        following_users.include?(other_user)
    end

    def feed_items
        Micropost.where(user_id: following_user_ids + [self.id])
    end

    def relation_users
        User.find(following_user_ids + [self.id])
    end

    def self.new_with_session(params, session)
        if session['devise.user_attributes']
            new(session['devise.user_attributes']) do |user|
                user.attributes = params
            end
        else
            super
        end
    end
end