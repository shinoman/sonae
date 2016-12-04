class Image < ActiveRecord::Base
    mount_uploader :image, ItemUploader
    belongs_to :item
end
