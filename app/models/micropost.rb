class Micropost < ActiveRecord::Base
#  before_save :prepare_save # This callback doesn't validate

  has_many :images
  belongs_to :user
  has_and_belongs_to_many :hashtags
  has_many :favorite_microposts, dependent: :destroy
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:1400 }

  def favorited_by? user
      favorite_microposts.exists?(user_id: user.id)
  end
  

  def prepare_save
    num = content.strip_tags.length
    if num <= 140
      self.checked = true
    else
      self.checked = false
    end
  end

end
