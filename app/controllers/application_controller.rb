class ApplicationController < ActionController::API

    def secret
        ENV["MY_SECRET"]
    end

    

    def generate_token(data)
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
        id = decode_token["id"]
        User.find_by(id: id)
    end

    def authorised
        !!get_user
    end
end
