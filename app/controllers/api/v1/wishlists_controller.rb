class Api::V1::WishlistsController < ApplicationController

    def index
        wishlists = Wishlist.all
        render json: wishlists
    end

    def show
        wishlist = Wishlist.find(params[:id])
        render json: wishlist
    end

    def create 
        # byebug
        wishlist = Wishlist.create(
            title: params[:title],
            user_id: params[:user_id]
        )
        render json: wishlist
    end

    def update
        wishlist = Wishlist.find(params[:id])
        wishlist.update(wishlist_params)
        render json: wishlist
    end

    def delete
        wishlist = Wishlist.find(params[:id])
        wishlist.destroy
    end

    def wishlist_params
        params.require(:wishlist).permit!
    end
end