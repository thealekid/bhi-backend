class ShopCommentsController < ApplicationController

    def create
        # byebug
        user = get_user
        if (user)
        
            shop_comment = ShopComment.new(create_shop_comment_params)
            shop_comment.update(user: user)
            render json: shop_comment
        end
    end

    private 

    def create_shop_comment_params
        params.permit(:shop_id, :description)
    end
end
