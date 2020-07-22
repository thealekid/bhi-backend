class ApplicationController < ActionController::API

    def secret
        ENV["MY_SECRET"]
    end

    

    def generate_token(data)
        # byebug
        data[:time] = Time.now.to_i
        JWT.encode(data, secret)
    end

    def decode_token
        token = request.headers["Authorisation"]
        begin
            JWT.decode(token, secret).first
        rescue
            {}
        end
    end

    def get_user
        token = decode_token
        if(token["access"] == "user")
            User.find_by(id: token["id"])
        elsif(token["access"] == "admin")
            Admin.find_by(id: token["id"])
        end
    end

    def get_admin
        token = decode_token
        if(token["access"] == "admin")
            Admin.find_by(id: token["id"])
        end
    end

    def authorised
        !!get_user
    end
end
