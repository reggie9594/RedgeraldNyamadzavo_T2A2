class User < ApplicationRecord
    belongs_to :access_level
    validates_presence_of :email
    validates_presence_of :password
    validates_presence_of :name
    # validates email    
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
