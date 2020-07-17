class CreateHairProductComments < ActiveRecord::Migration[6.0]
  def change
    create_table :hair_product_comments do |t|

      t.timestamps
    end
  end
end
