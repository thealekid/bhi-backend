class CreateShopComments < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_comments do |t|

      t.timestamps
    end
  end
end
