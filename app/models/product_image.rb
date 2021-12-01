class ProductImage < ApplicationRecord
    # mount_uploader :attachment, AttachmentUploader, service: :google # Tells rails to use this uploader for this model.   
   validates :name, presence: true # Make sure the owner's name is present. 
   has_one_attached :attachment, service: :google
end
