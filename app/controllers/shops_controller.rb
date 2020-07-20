class ShopsController < ApplicationController

    def index
        shops = Shop.all
        render json: shops
    end

    def search
        shops = Shop.where("postcode ilike ?", "%#{params[:search]}%")
        render json: shops
    end
    
end
