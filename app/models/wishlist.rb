class Wishlist < ApplicationRecord
    has_many :wishlist_items
    has_many :items, through: :wishlist_items
    belongs_to :user
end
