class Photo < ApplicationRecord
    mount_uploader :photo_img, ImageUploader
end
