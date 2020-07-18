class UsersController < ApplicationController

    def login
        user =  User.find_by(username: params[:username])
        generate_token({id: user.id})
        if user && user.authenticate(params[:password])
            render json: {user: user, token: generate_token({id: user.id})}
        else
            render json: {message: "login error"}, status: :unauthorized
        end
    end

    def signup
        user = User.create(create_user_params)
        if(user.valid?)
            render json: {user: user, token: generate_token({id: user.id})}, status: :created
        else
            render json: {message: "Signup error"}, status: :unauthorized
        end
    end

  

    private

    def create_user_params
        params.permit(:first_name, :last_name, :username, :email_address, :password, :password_confirmation)
    end
end
