class Sale < ApplicationRecord
    belongs_to :product, :dependent => :destroy
  
end
