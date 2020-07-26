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

    def create
        if (get_user)
            shop = Shop.create(create_shop_params)
            if (shop.valid?)
                render json: shop
            else 
                render json: {message: "Creation failed!", error: shop.errors.full_messages}, status: :unauthorized
            end
        else
            render json: {message: "You cannot create a shop without an account!", error: shop.errors.full_messages}, status: :unauthorized
        end
        
    end

    def decline
        if (get_admin)
            shop = Shop.find_by(id: params[:id])
            shop.destroy
            render json: {message: "Shop deleted!"}
        else
            render json: {message: "You're not an admin, only an admin is allowed!"}, status: :unauthorized
        end
    end

    def search
        searched = Shop.where("postcode ilike ?", "%#{params[:search]}%")
        shops = searched.filter{|shop| shop.approved}
        render json: shops
    end

    def approved
        shop = Shop.find_by(id: params[:id])
        shop.update(approved: true)
        render json: {approved: shop.approved}
    end
    
 



    private

    def create_shop_params
        params.require(:shop).permit(:name, :image_url, :phone_number, :opening_hours, :address, :town, :county, :country, :postcode, :service, )
    end
    
end
