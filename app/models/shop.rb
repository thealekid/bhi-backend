class Shop < ApplicationRecord

    has_many    :shop_comments

    validates :name, presence: true
    validates :image_url, presence: true
    validates :phone_number, presence: true
    validates :opening_hours, presence: true
    validates :address, presence: true
    validates :town, presence: true
    validates :county, presence: true
    validates :country, presence: true
    validates :postcode, presence: true
    validates :service, presence: true
    
end
