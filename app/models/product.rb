class Product < ActiveRecord::Base
    mount_uploader :img, ImgUploader
end
