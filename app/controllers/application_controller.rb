class ApplicationController < ActionController::API

    def secret
        ENV["MY_SECRET"]

    end

    def generate_token(data)
        data[:time] = Time.now.to_i
        JWT.encode(data, secret)
    end

end
