class AdminsController < ApplicationController

    def login
        # byebug
        admin = Admin.find_by(username: params[:username])
        if admin && admin.authenticate(params[:password])
            render json: {admin: {id: admin.id, username: admin.username}, token: generate_token({id: admin.id, access: "admin"})}
        else
            render json: {message: "You are not an Admin"}, status: :unauthorized
        end
    end

    def signup
        admin = Admin.create(create_admin_params)
        if(admin.valid?)
            render json: {admin: {id: admin.id, username: admin.username}, token: generate_token({id: admin.id, access: "admin"})}, status: :created
        else
            render json: {message: "Signup error"}, status: :unauthorized
        end
    end

    def validate
        admin = get_admin
        if admin
            render json: {admin: {id: admin.id, username: admin.username}, token: generate_token({id: admin.id, acces: "admin"})}
        else
            render json: {message: "validate error"}, status: :unauthorized
        end
    end

    # def unapproved_users
    #     users = User.where(approved: false)
    #     render json: users
    # end

    def unapproved_shops
        shops = Shop.where(approved: false)
        render json: shops
    end

    private

    def create_admin_params
        params.permit(:username, :password, :password_confirmation)
    end
end
