class ShopsController < ApplicationController

    def index
        shops = Shop.all
        render json: shops
    end

    def show
        if (get_user)
            shop = Shop.find_by(id: params[:id])
            render json: {shop: shop, comments: shop.shop_comments.reverse}
        else
            render json: {message: "You're not logged in!"}, status: :unauthorized
        end
    end

    def search
        shops = Shop.where("postcode ilike ?", "%#{params[:search]}%")
        render json: shops
    end
    
end
