class Micropost < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :hashtags
  has_many :favorite_microposts, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:140 }
  
  def favorited_by? user
      favorite_microposts.exists?(user_id: user.id)
  end
end
