class UsersController < ApplicationController
    
    def login
        user =  User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {user: {id: user.id, username: user.username}, token: generate_token({id: user.id, access: "user"})}
        else
            render json: {message: "Username & Password do not match"}, status: :unauthorized
        end
    end

    def signup
        user = User.create(create_user_params)
        if(user.valid?)
            render json: {user: {id: user.id, username: user.username}, token: generate_token({id: user.id, access: "user"})}, status: :created
        else
            render json: {message: "Signup error", error: user.errors.full_messages}, status: :unauthorized
        end
    end

    def validate
        
        # byebug
        user = get_user
        if (user.class == User)
            render json: {user: {id: user.id, username: user.username}, type: "user", token: generate_token({id: user.id, access: "user"})}
        elsif (user.class == Admin)
        # byebug
            render json: {admin: {id: user.id, username: user.username}, type: "admin", token: generate_token({id: user.id, access: "admin"})}
        else
            render json: {message: "validate error"}, status: :unauthorized
        end
    end

    def approved
        user = User.find_by(id: params[:id])
        user.update(approved: true)
        render json: {approved: user.approved}
    end

  

    private

    def create_user_params
        params.permit(:first_name, :last_name, :username, :email_address, :password, :password_confirmation)
    end
end
