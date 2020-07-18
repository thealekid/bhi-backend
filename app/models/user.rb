class User < ApplicationRecord
    has_secure_password
    has_many    :hair_product_comments
    has_many    :shop_comments

end
