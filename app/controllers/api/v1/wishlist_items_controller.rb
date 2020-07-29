class Api::V1::WishlistItemsController < ApplicationController

    def index
        wishlist_items = WishlistItem.all
        render json: wishlist_items
    end

    def show
        wishlist_item = WishlistItem.find(params[:id])
        render json: wishlist_item
    end

    def create 
        wishlist_item = WishlistItem.create(wishlist_item_params)
        render json: wishlist_item
    end

    def update
        wishlist_item = WishlistItem.find(params[:id])
        wishlist_item.update(wishlist_item_params)
        render json: wishlist_item
    end

    def delete
        wishlist_item = WishlistItem.find(params[:id])
        wishlist_item.destroy
    end

    def wishlist_item_params
        params.require(:wishlist_item).permit!
    end
end