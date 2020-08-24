class HairProductComment < ApplicationRecord

    belongs_to  :user
    belongs_to  :hair_product
    
end
