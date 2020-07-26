class User < ApplicationRecord
    has_secure_password
    has_many    :hair_product_comments
    has_many    :shop_comments, dependent: :destroy

    validates :first_name, :last_name, presence: true
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email_address, presence: true ,uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, on: :create
   

end
