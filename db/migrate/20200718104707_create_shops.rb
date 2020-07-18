class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :image_url
      t.string :address
      t.string :type
      t.integer :phone_number
      t.string :opening_hours

      t.timestamps
    end
  end
end
