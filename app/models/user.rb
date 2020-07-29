class User < ApplicationRecord
    has_many :wishlists

    validates :username, uniqueness: true

    has_secure_password
end
