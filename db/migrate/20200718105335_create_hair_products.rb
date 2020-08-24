class CreateHairProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :hair_products do |t|
      t.string :name
      t.string :image_url
      t.string :description
      t.string :use
      t.string :ingredients

      t.timestamps
    end
  end
end
