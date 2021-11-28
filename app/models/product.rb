class Product < ApplicationRecord
    belongs_to :user, :dependent => :destroy
    validates_presence_of :price
    validates_presence_of :description
    validates_presence_of :quantity
    validates_numericality_of :price, :message=>"Invalid price"
    scope :isNotDeleted, -> { where(isDeleted:false) }
end
